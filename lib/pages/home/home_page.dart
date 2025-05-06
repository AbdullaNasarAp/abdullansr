import 'package:abdullansr/widgets/animated_background_for_about.dart';
import 'package:abdullansr/widgets/footer.dart';
import 'package:abdullansr/pages/home/widget/hero_section.dart';
import 'package:abdullansr/widgets/loading_screen.dart';
import 'package:abdullansr/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isContentLoaded = false;
  bool _isPrecacheComplete = false;

  @override
  void initState() {
    super.initState();
    // Start non-build-context-dependent initialization here
    _startLoading();
  }

  void _startLoading() async {
    // Simulate loading time
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isContentLoaded = true);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Perform context-dependent operations here
    if (!_isPrecacheComplete) {
      _precacheImages();
    }
  }

  Future<void> _precacheImages() async {
    await precacheImage(const AssetImage('assets/image/profile.jpeg'), context);
    if (mounted) {
      setState(() => _isPrecacheComplete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isContentLoaded || !_isPrecacheComplete) {
      return const LoadingScreen();
    }

    final currentPath = GoRouterState.of(context).uri.toString();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: NavBar(currentPath: currentPath),
      ),
      body: Stack(
        children: [
          const AnimatedAboutBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                const HeroSection(),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.050),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
