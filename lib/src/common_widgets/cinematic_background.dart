import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/constants.dart';

class CinematicBackground extends StatelessWidget {
  final Widget child;
  const CinematicBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark background
        Container(color: AppColors.background),
        
        // Animated Mesh Gradients
        Positioned(
          top: -200,
          right: -100,
          child: _GlowOrb(
            color: AppColors.accentPrimary.withValues(alpha: 0.15),
            size: 600,
          ).animate(onPlay: (controller) => controller.repeat(reverse: true))
           .scaleXY(begin: 0.8, end: 1.2, duration: 8.seconds, curve: Curves.easeInOut)
           .moveX(begin: -50, end: 50, duration: 12.seconds, curve: Curves.easeInOut),
        ),
        Positioned(
          bottom: -200,
          left: -200,
          child: _GlowOrb(
            color: AppColors.accentSecondary.withValues(alpha: 0.15),
            size: 800,
          ).animate(onPlay: (controller) => controller.repeat(reverse: true))
           .scaleXY(begin: 1.1, end: 0.9, duration: 10.seconds, curve: Curves.easeInOut)
           .moveY(begin: 50, end: -50, duration: 15.seconds, curve: Curves.easeInOut),
        ),
        Positioned(
          top: 300,
          left: 100,
          child: _GlowOrb(
            color: AppColors.accentTertiary.withValues(alpha: 0.05),
            size: 400,
          ).animate(onPlay: (controller) => controller.repeat(reverse: true))
           .fadeIn(duration: 5.seconds)
           .fadeOut(duration: 5.seconds, delay: 5.seconds),
        ),

        // Subtle Grid/Orbit Lines
        Positioned.fill(
          child: CustomPaint(
            painter: _GridPainter(),
          ),
        ),
        
        // Star Particles
        const Positioned.fill(
          child: _StarParticles(),
        ),

        // Noise Texture Overlay (Optional, can be a subtle noise image, using low opacity black here as placeholder)
        Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.02),
          ),
        ),

        // Content
        child,
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowOrb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.05)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double spacing = size.width / 10;
    
    // Draw vertical curves (orbit lines)
    for (int i = 0; i <= 10; i++) {
      final path = Path();
      path.moveTo(i * spacing, 0);
      path.quadraticBezierTo(
        size.width / 2, size.height / 2, // control point
        i * spacing, size.height, // end point
      );
      canvas.drawPath(path, paint);
    }
    
    // Draw horizontal curves
    for (int i = 0; i <= 10; i++) {
      final path = Path();
      path.moveTo(0, i * spacing);
      path.quadraticBezierTo(
        size.width / 2, size.height / 2,
        size.width, i * spacing,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StarParticles extends StatefulWidget {
  const _StarParticles();

  @override
  State<_StarParticles> createState() => _StarParticlesState();
}

class _StarParticlesState extends State<_StarParticles> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Generate random particles
    for (int i = 0; i < 50; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          size: _random.nextDouble() * 2 + 1,
          speed: _random.nextDouble() * 0.2 + 0.1,
          opacity: _random.nextDouble() * 0.5 + 0.1,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(_particles, _controller.value),
        );
      },
    );
  }
}

class _Particle {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;

  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;

  _ParticlePainter(this.particles, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final double currentY = (particle.y - (progress * particle.speed)) % 1.0;
      final double actualY = currentY < 0 ? currentY + 1.0 : currentY;
      
      final paint = Paint()
        ..color = Colors.white.withValues(alpha: particle.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(particle.x * size.width, actualY * size.height),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
