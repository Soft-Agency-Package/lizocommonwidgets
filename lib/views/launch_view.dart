import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LaunchView extends StatefulWidget {
  final String startImage;
  final String endImage;

  const LaunchView({
    super.key,
    required this.startImage,
    required this.endImage,
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
