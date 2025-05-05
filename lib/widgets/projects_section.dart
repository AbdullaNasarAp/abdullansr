// lib/widgets/premium_projects_section.dart
import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:abdullansr/data/projects_data.dart';
import 'package:abdullansr/models/project.dart';
import 'package:abdullansr/widgets/project_card.dart';
import 'package:abdullansr/widgets/project_dialog.dart';
import 'package:abdullansr/widgets/project_filter_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumProjectsSection extends StatefulWidget {
  const PremiumProjectsSection({super.key});

  @override
  State<PremiumProjectsSection> createState() => _PremiumProjectsSectionState();
}

class _PremiumProjectsSectionState extends State<PremiumProjectsSection> {
  final List<String> allCategories = ['All', 'Mobile', 'Web', 'Full Stack'];
  final List<String> allTechnologies = [
    'Flutter',
    'Firebase',
    'GetX',
    'GraphQL',
    'BLoC',
    'REST API',
    'UI/UX',
  ];

  String selectedCategory = 'All';
  Set<String> selectedTechnologies = <String>{};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final filteredProjects =
        projects.where((project) {
          final categoryMatch =
              selectedCategory == 'All' || project.category == selectedCategory;
          final techMatch =
              selectedTechnologies.isEmpty ||
              project.technologies.any(
                (tech) => selectedTechnologies.contains(tech),
              );
          return categoryMatch && techMatch;
        }).toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width > 1200 ? size.width * 0.1 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with animated underline
          Stack(
            children: [
              Text(
                'Featured Projects',
                style: TextStyles.displayMedium(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                      width: 120,
                      height: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.accent],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .scaleX(
                      begin: 1,
                      end: 1.2,
                      duration: 2.seconds,
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Category filter with animated selection
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  allCategories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        selectedColor: AppColors.primary,
                        labelStyle: GoogleFonts.poppins(
                          color:
                              selectedCategory == category
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color:
                                selectedCategory == category
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                          ),
                        ),
                      ).animate().fadeIn(
                        delay: (100 * allCategories.indexOf(category)).ms,
                      ),
                    );
                  }).toList(),
            ),
          ),

          const SizedBox(height: 24),

          // Technology filter with animated chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                allTechnologies.map((tech) {
                  return PremiumFilterChip(
                    label: tech,
                    selected: selectedTechnologies.contains(tech),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedTechnologies.add(tech);
                        } else {
                          selectedTechnologies.remove(tech);
                        }
                      });
                    },
                  ).animate().fadeIn(
                    delay: (100 * allTechnologies.indexOf(tech)).ms,
                  );
                }).toList(),
          ),

          const SizedBox(height: 40),

          // Projects grid with staggered animation
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width > 1200 ? 2 : 1,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: size.width > 768 ? 1.6 : 1.2,
            ),
            itemCount: filteredProjects.length,
            itemBuilder: (context, index) {
              return PremiumProjectCard(
                project: filteredProjects[index],
                onTap:
                    () => _showProjectDetails(context, filteredProjects[index]),
              ).animate().slide(
                delay: (200 + (index * 100)).ms,
                duration: 500.ms,
                curve: Curves.easeOutQuint,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showProjectDetails(BuildContext context, Project project) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(child: PremiumProjectDialog(project: project));
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutQuint,
          ),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
