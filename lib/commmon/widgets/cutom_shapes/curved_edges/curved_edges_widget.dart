import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/curved_edges/curved_edges.dart';

class TCustomEdgeWidget extends StatelessWidget {
  const TCustomEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
