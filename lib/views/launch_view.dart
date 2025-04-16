import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LaunchView extends StatefulWidget {
  final String startImage;
  final String endImage;
  final int durationInSeconds;
  final String nextPage;

  const LaunchView({
    super.key,
    required this.startImage,
    required this.endImage,
    required this.durationInSeconds,
    required this.nextPage,
  });

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _showFinalScreen = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showFinalScreen = true;
      });
    });

    Future.delayed(Duration(seconds: widget.durationInSeconds), () {
      if (!mounted) return;
      context.go(widget.nextPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      child:
          _showFinalScreen
              ? FinalLaunch(endImage: widget.endImage)
              : InitialLaunch(
                animation: _fadeAnimation,
                startImage: widget.startImage,
              ),
    );
  }
}

class InitialLaunch extends StatelessWidget {
  final Animation<double> animation;
  final String startImage;
  const InitialLaunch({
    super.key,
    required this.animation,
    required this.startImage,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SvgPicture.asset(startImage, width: 100, height: 100),
        ),
      ),
    );
  }
}

class FinalLaunch extends StatelessWidget {
  final String endImage;
  const FinalLaunch({super.key, required this.endImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Center(
          child: SvgPicture.asset(endImage, width: 100, height: 100),
        ),
      ),
    );
  }
}
