import 'package:abdullansr/pages/about_page.dart';
import 'package:abdullansr/pages/contact_page.dart';
import 'package:abdullansr/pages/home_page.dart';
import 'package:abdullansr/pages/projects_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(path: 'about', builder: (context, state) => const AboutPage()),
        GoRoute(
          path: 'projects',
          builder: (context, state) => const ProjectsPage(),
        ),
        GoRoute(
          path: 'contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
  ],
);
