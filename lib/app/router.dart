import 'package:abdullansr/pages/about/about_page.dart';
import 'package:abdullansr/pages/contact/contact_page.dart';
import 'package:abdullansr/pages/home/home_page.dart';
import 'package:abdullansr/pages/project/projects_page.dart';
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
