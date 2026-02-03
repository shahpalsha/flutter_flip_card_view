import 'dart:math';
import 'package:flutter/material.dart';
import 'flip_direction.dart';

class FlipCardView extends StatefulWidget {
  final Widget front;
  final Widget back;
  final FlipDirection direction;
  final Duration duration;

  FlipCardView({
    required this.front,
    required this.back,
    this.direction = FlipDirection.horizontal,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<FlipCardView> createState() => _FlipCardViewState();
}

class _FlipCardViewState extends State<FlipCardView>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  void flip() {
    if (isFront) {
      controller.forward();
    } else {
      controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: flip,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final angle = controller.value * pi;

          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(widget.direction == FlipDirection.horizontal ? angle : 0)
            ..rotateX(widget.direction == FlipDirection.vertical ? angle : 0);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: controller.value < 0.5
                ? _buildFront()
                : Transform(
              transform: widget.direction ==
                  FlipDirection.horizontal
                  ? Matrix4.rotationY(pi)
                  : Matrix4.rotationX(pi),
              alignment: Alignment.center,
              child: _buildBack(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: widget.front,
    );
  }

  Widget _buildBack() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: widget.back,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
