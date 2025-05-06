// lib/widgets/premium_project_dialog.dart
import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/pages/project/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class PremiumProjectDialog extends StatefulWidget {
  final Project project;

  const PremiumProjectDialog({super.key, required this.project});

  @override
  State<PremiumProjectDialog> createState() => _PremiumProjectDialogState();
}

class _PremiumProjectDialogState extends State<PremiumProjectDialog> {
  int _currentImageIndex = 0;
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  // Image carousel
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 500,
                        viewportFraction: 1,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                      items:
                          [
                            widget.project.imageUrl,
                            ...widget.project.screenshots,
                          ].map((image) {
                            return Image.asset(
                              image,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            );
                          }).toList(),
                    ),
                  ),

                  // Close button
                  Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),

                  // Image indicators
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (
                          int i = 0;
                          i < widget.project.screenshots.length + 1;
                          i++
                        )
                          Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _currentImageIndex == i
                                      ? AppColors.primary
                                      : Colors.white.withOpacity(0.5),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.project.title,
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          '${widget.project.completionYear} • ${widget.project.role}',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Expandable description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedSize(
                          duration: 300.ms,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  _isDescriptionExpanded
                                      ? double.infinity
                                      : 100,
                            ),
                            child: Text(
                              widget.project.longDescription,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        if (!_isDescriptionExpanded)
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed:
                                  () => setState(
                                    () => _isDescriptionExpanded = true,
                                  ),
                              child: const Text('Read more'),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Features with animated list
                    Text(
                      'Key Features:',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...widget.project.features.map((feature) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 6,
                                    right: 12,
                                  ),
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            )
                            .animate()
                            .fadeIn(
                              delay:
                                  (100 *
                                          widget.project.features.indexOf(
                                            feature,
                                          ))
                                      .ms,
                            )
                            .slideX(begin: 0.5, duration: 300.ms),
                      );
                    }).toList(),

                    const SizedBox(height: 30),

                    // Technology stack
                    Text(
                      'Technology Stack:',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          widget.project.technologies.map((tech) {
                            return Chip(
                                  label: Text(tech),
                                  backgroundColor: AppColors.primary
                                      .withOpacity(0.1),
                                  labelStyle: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                .animate()
                                .fadeIn(
                                  delay:
                                      (100 *
                                              widget.project.technologies
                                                  .indexOf(tech))
                                          .ms,
                                )
                                .scale();
                          }).toList(),
                    ),

                    const SizedBox(height: 40),

                    // Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.project.githubUrl != null)
                          ElevatedButton.icon(
                            onPressed: () {
                              launchUrl(Uri.parse(widget.project.githubUrl!));
                            },
                            icon: const Icon(Icons.code),
                            label: const Text('View Code'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                        if (widget.project.playStoreUrl != null) ...[
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(widget.project.playStoreUrl!),
                              );
                            },
                            icon: const Icon(Icons.android),
                            label: const Text('Play Store'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],

                        if (widget.project.appStoreUrl != null) ...[
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              launchUrl(Uri.parse(widget.project.appStoreUrl!));
                            },
                            icon: const Icon(Icons.phone_iphone),
                            label: const Text('App Store'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
