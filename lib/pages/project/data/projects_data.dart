import 'package:abdullansr/pages/project/models/project.dart';

final List<Project> projects = [
  // ──────────────────────────────
  // Project: Eefind App
  // ──────────────────────────────
  Project(
    id: 'eefind',
    title: 'Eefind App',
    shortDescription: 'All-in-one local discovery platform.',
    longDescription:
        'Enhanced user experience with features like grocery shopping, event booking, and leisure activities. '
        'Integrated with map and user profile modules for convenience.',
    technologies: ['Flutter', 'GetX', 'GraphQL', 'Hasura'],
    imageUrl: 'assets/image/eefind.webp',
    features: [
      'Grocery shopping module',
      'Event booking system',
      'Leisure activities integration',
      'Map functionality',
      'Profile management',
    ],
    category: 'Lifestyle',
    completionYear: 2023,
    role: 'Flutter Developer',
    screenshots: ['assets/image/eefind.webp', 'assets/image/eefind.webp'],
  ),

  // ──────────────────────────────
  // Project: Caregigs
  // ──────────────────────────────
  Project(
    id: 'caregigs',
    title: 'Caregigs',
    shortDescription: 'Nursing job platform for America & Europe.',
    longDescription:
        'Streamlined job search for nurses in America and Europe with user-friendly interface, '
        'enabling resume uploads, job filters, and direct applications.',
    technologies: ['Flutter', 'Firebase', 'Provider'],
    imageUrl: 'assets/image/caregigs.webp',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.caregigs.co&hl=en_IN',
    features: [
      'Nurse account creation',
      'Resume upload functionality',
      'Job application system',
      'Search and filtering',
    ],
    category: 'Job Search',
    completionYear: 2024,
    role: 'Flutter Developer',
    screenshots: ['assets/image/caregigs.webp', 'assets/image/caregigs.webp'],
  ),

  // ──────────────────────────────
  // Project: Centa for Teachers
  // ──────────────────────────────
  Project(
    id: 'centa',
    title: 'Centa for Teachers',
    shortDescription: 'Global certification for teachers.',
    longDescription:
        'Teacher certification modules for competency assessment and global accreditation. '
        'Features personalized dashboards and curated resources.',
    technologies: ['Flutter', 'Firebase', 'BLoC'],
    imageUrl: 'assets/image/centa.jpg',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=org.mcenta.app&hl=en_IN',
    features: [
      'Certification modules',
      'Competency assessment',
      'Personalized learning dashboard',
      '1000+ curated resources',
    ],
    category: 'Education',
    completionYear: 2024,
    role: 'Flutter Developer',
    screenshots: ['assets/image/centa.jpg', 'assets/image/centa.jpg'],
  ),

  // ──────────────────────────────
  // Project: Easy Cook
  // ──────────────────────────────
  Project(
    id: 'easycook',
    title: 'Easy Cook',
    shortDescription: 'Field team tracking and reporting tool.',
    longDescription:
        'Sales, service, and attendance management app for Easy Cook’s field team. '
        'Reduced manual tracking errors by 40% through automation and dashboards.',
    technologies: ['Flutter', 'GetX', 'REST API'],
    imageUrl: 'assets/image/easy_cook.png',
    features: [
      'Sales tracking',
      'Service management',
      'Attendance system',
      'Reporting dashboard',
    ],
    category: 'Business',
    completionYear: 2023,
    role: 'Flutter Developer',
    screenshots: ['assets/image/easy_cook.png', 'assets/image/easy_cook.png'],
  ),

  // ──────────────────────────────
  // Project: Multistore Application (Siopa)
  // ──────────────────────────────
  Project(
    id: 'siopa',
    title: 'Siopa - Multistore E-commerce App',
    shortDescription:
        'A multivendor e-commerce platform built using Flutter and Firebase.',
    longDescription:
        'Siopa is a feature-rich multivendor e-commerce platform designed for both customers and suppliers. '
        'Built with Flutter and Firebase, it supports advanced authentication options, real-time product and order management, '
        'push notifications, and secure payments via Stripe. The app separates the supplier and customer experience, '
        'enabling streamlined store management, personalized shopping, and more.',
    technologies: ['Flutter', 'Firebase', 'Stripe', 'REST API'],
    imageUrl: 'assets/image/project.png',
    githubUrl: 'https://github.com/AbdullaNasarAp/Multistoreapplication',
    features: [
      // Authentication
      'Authentication with Google, Facebook, Email & Password, Anonymous',
      // Supplier
      'Supplier: Upload/Edit Products',
      'Supplier: Store Management',
      'Supplier: Order Management',
      'Supplier: Push Notifications',
      'Supplier: Balance Overview and Sales Statistics',
      // Customer
      'Customer: Product Browsing & Categories',
      'Customer: Cart and Wishlist Management',
      'Customer: Offers & Discounts',
      'Customer: Address Management',
      'Customer: Stripe Payment Integration',
      'Customer: Store and Profile Pages',
    ],
    category: 'E-commerce',
    completionYear: 2024,
    role: 'Flutter Developer',
    screenshots: ['assets/image/project.png', 'assets/image/project.png'],
  ),

  // ──────────────────────────────
  // Project: Paatify Music
  // ──────────────────────────────
  Project(
    id: 'paatify',
    title: 'Paatify Music',
    shortDescription: 'Music streaming application.',
    longDescription:
        'Paatify Music is a Flutter-based music streaming app that allows users to browse, play, and manage their favorite tracks. '
        'It features a sleek UI, playlist creation, and seamless audio playback.',
    technologies: ['Flutter', 'Dart', 'Provider', 'Audio Players'],
    imageUrl: 'assets/image/project.png', // Sample Image URL
    features: [
      'Browse and Search Music',
      'Create and Manage Playlists',
      'High-Quality Audio Streaming',
      'User Authentication',
    ],
    category: 'Entertainment',
    completionYear: 2023,
    role: 'Flutter Developer',
    screenshots: [
      'assets/image/project.png', // Sample Screenshot URL
      'assets/image/project.png', // Sample Screenshot URL
    ],
    githubUrl: 'https://github.com/AbdullaNasarAp/Paatify-music', // GitHub link
  ),

  // ──────────────────────────────
  // Project: GraphQL Project
  // ──────────────────────────────
  Project(
    id: 'graphql_project',
    title: 'GraphQL Project',
    shortDescription: 'Application demonstrating GraphQL integration.',
    longDescription:
        'This project showcases the integration of GraphQL in a Flutter application, allowing for efficient data fetching and state management. '
        'It serves as a reference for implementing GraphQL queries and mutations in mobile apps.',
    technologies: ['Flutter', 'GraphQL', 'Dart'],
    imageUrl: 'assets/image/project.png', // Sample Image URL
    features: [
      'GraphQL Queries and Mutations',
      'State Management with Provider',
      'Responsive UI Design',
    ],
    category: 'Development',
    completionYear: 2023,
    role: 'Flutter Developer',
    screenshots: [
      'assets/image/project.png', // Sample Screenshot URL
      'assets/image/project.png', // Sample Screenshot URL
    ],
    githubUrl:
        'https://github.com/AbdullaNasarAp/graphqlProject', // GitHub link
  ),

  // ──────────────────────────────
  // Project: My First App
  // ──────────────────────────────
  Project(
    id: 'my_first_app',
    title: 'My First App',
    shortDescription: 'Initial Flutter application.',
    longDescription:
        'This was my inaugural project in Flutter, focusing on understanding the basics of widget tree, state management, and UI design. '
        'It laid the foundation for my subsequent Flutter development journey.',
    technologies: ['Flutter', 'Dart'],
    imageUrl: 'assets/image/project.png', // Sample Image URL
    features: [
      'Basic UI Components',
      'Stateful and Stateless Widgets',
      'Navigation and Routing',
    ],
    category: 'Learning',
    completionYear: 2022,
    role: 'Flutter Developer',
    screenshots: [
      'assets/image/project.png', // Sample Screenshot URL
      'assets/image/project.png', // Sample Screenshot URL
    ],
    githubUrl: 'https://github.com/AbdullaNasarAp/My-First-App-', // GitHub link
  ),
];
