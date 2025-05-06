import 'dart:convert';

import 'package:abdullansr/app/config.dart';
import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final formKeyProvider = Provider((ref) => GlobalKey<FormState>());
final nameProvider = StateProvider((ref) => '');
final emailProvider = StateProvider((ref) => '');
final messageProvider = StateProvider((ref) => '');
final isSubmittingProvider = StateProvider((ref) => false);
final isSuccessProvider = StateProvider((ref) => false);

class ContactForm extends ConsumerWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formKeyProvider);
    final isSubmitting = ref.watch(isSubmittingProvider);
    final isSuccess = ref.watch(isSuccessProvider);

    if (isSuccess) {
      return _buildSuccessMessage(
        context,
        ref,
      ); // Pass ref to _buildSuccessMessage
    }

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name field
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Your Name',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onChanged: (value) => ref.read(nameProvider.notifier).state = value,
          ).animate().fadeIn(delay: 100.ms),

          const SizedBox(height: 20),

          // Email field
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email Address',
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onChanged:
                (value) => ref.read(emailProvider.notifier).state = value,
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 20),

          // Message field
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Your Message',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.message),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              if (value.length < 10) {
                return 'Message should be at least 10 characters';
              }
              return null;
            },
            onChanged:
                (value) => ref.read(messageProvider.notifier).state = value,
          ).animate().fadeIn(delay: 300.ms),

          const SizedBox(height: 30),

          // Submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isSubmitting ? null : () => _submitForm(ref, context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.primary,
              ),
              child:
                  isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text('Send Message', style: TextStyles.button(context)),
            ).animate().fadeIn(delay: 400.ms),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 60),
          const SizedBox(height: 20),
          Text(
            'Message Sent Successfully!',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.green),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thank you for reaching out. I will get back to you soon.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ref.read(isSuccessProvider.notifier).state =
                  false; // Use ref directly
            },
            child: const Text('Send Another Message'),
          ),
        ],
      ),
    ).animate().scale();
  }

  Future<void> _submitForm(WidgetRef ref, BuildContext context) async {
    final formKey = ref.read(formKeyProvider);

    if (!formKey.currentState!.validate()) return;

    ref.read(isSubmittingProvider.notifier).state = true;

    // Prepare template parameters
    final templateParams = {
      'name': ref.read(nameProvider),
      'email': ref.read(emailProvider),
      'message': ref.read(messageProvider),
    };

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': EmailJSConfig.serviceId,
          'template_id': EmailJSConfig.templateId,
          'user_id': EmailJSConfig.userId, // Public Key (User ID)
          'template_params': templateParams,
        }),
      );

      if (response.statusCode == 200) {
        print('SUCCESS!');
        ref.read(isSuccessProvider.notifier).state = true;
        formKey.currentState!.reset();
        ref.read(nameProvider.notifier).state = '';
        ref.read(emailProvider.notifier).state = '';
        ref.read(messageProvider.notifier).state = '';
      } else {
        print('ERROR... ${response.statusCode}: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send message. Please try again.'),
          ),
        );
      }
    } catch (error) {
      print('ERROR: $error');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $error')));
    } finally {
      ref.read(isSubmittingProvider.notifier).state = false;
    }
  }
}
