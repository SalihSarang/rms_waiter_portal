import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [ShimmerScope] manages a synchronized [AnimationController] that can be shared
/// by multiple [PulseContainer]s to create a unified shimmer/pulse effect across a screen.
class ShimmerScope extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ShimmerScope({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<ShimmerScope> createState() => _ShimmerScopeState();

  static Animation<double>? of(BuildContext context) {
    final _ShimmerInherited? inherited = context
        .dependOnInheritedWidgetOfExactType<_ShimmerInherited>();
    return inherited?.animation;
  }
}

class _ShimmerScopeState extends State<ShimmerScope>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

    _animation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ShimmerInherited(animation: _animation, child: widget.child);
  }
}

class _ShimmerInherited extends InheritedWidget {
  final Animation<double> animation;

  const _ShimmerInherited({required this.animation, required super.child});

  @override
  bool updateShouldNotify(_ShimmerInherited oldWidget) =>
      animation != oldWidget.animation;
}

/// [PulseContainer] is a reusable animated widget that creates a "breathing"
/// skeleton effect. It's used as a placeholder while data is loading.
///
/// It requires a [ShimmerScope] ancestor to provide the synchronized animation.
/// If no [ShimmerScope] is present, it will fallback to a static container.
class PulseContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;

  const PulseContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final animation = ShimmerScope.of(context);
    final baseColor = color ?? NeutralColors.surface;

    // Standardize highlight color using a subtle white overlay.
    final highlightColor =
        color?.withValues(alpha: 0.8) ??
        TextColors.primary.withValues(alpha: 0.05);

    final decoration = BoxDecoration(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      color: baseColor,
    );

    if (animation == null) {
      return Container(width: width, height: height, decoration: decoration);
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: decoration.copyWith(
            gradient: LinearGradient(
              begin: Alignment(animation.value - 1.0, -0.3),
              end: Alignment(animation.value + 1.0, 0.3),
              colors: [baseColor, highlightColor, baseColor],
              stops: const [0.1, 0.5, 0.9],
            ),
          ),
        );
      },
    );
  }
}
