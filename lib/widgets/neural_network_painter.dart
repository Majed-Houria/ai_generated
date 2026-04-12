import 'package:flutter/material.dart';
import 'dart:math' as math;

class NeuralNetworkPainter extends CustomPainter {
  final double progress;
  final Color color;

  NeuralNetworkPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Generate a fixed number of pseudo-random nodes that shift slowly
    final paintLine = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..strokeWidth = 1.0;

    final paintNode = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const nodeCount = 30;
    final List<Offset> nodes = [];

    // Create drifting nodes
    for (int i = 0; i < nodeCount; i++) {
      // pseudo random deterministic patterns
      final double rx =
          (math.sin(i * 1.5 + progress * math.pi * 2) * 0.5 + 0.5) * size.width;
      final double ry =
          (math.cos(i * 2.1 - progress * math.pi * 2) * 0.5 + 0.5) *
          size.height;
      nodes.add(Offset(rx, ry));
    }

    // Connect nodes if close to each other
    for (int i = 0; i < nodes.length; i++) {
      for (int j = i + 1; j < nodes.length; j++) {
        final double dist = (nodes[i] - nodes[j]).distance;
        if (dist < 120.0) {
          // fades out on distance
          paintLine.color = color.withValues(alpha: (1.0 - dist / 120.0) * 0.6);
          canvas.drawLine(nodes[i], nodes[j], paintLine);
        }
      }
      // draw node
      canvas.drawCircle(nodes[i], 2.5, paintNode);
    }
  }

  @override
  bool shouldRepaint(covariant NeuralNetworkPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
