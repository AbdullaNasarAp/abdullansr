// lib/models/project.dart
class Project {
  final String id;
  final String title;
  final String shortDescription;
  final String longDescription;
  final List<String> technologies;
  final String imageUrl;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final List<String> features;
  final String category;
  final int completionYear;
  final String role;
  final List<String> screenshots;

  const Project({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.technologies,
    required this.imageUrl,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.features,
    required this.category,
    required this.completionYear,
    required this.role,
    required this.screenshots,
  });
}
