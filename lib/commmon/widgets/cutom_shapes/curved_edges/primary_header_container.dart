import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/circular_container.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCustomEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // If[size.isFnite': is not true in stack ] error occurred
          height: 400,
          child: Stack(
            children: [
              // background custom shapes
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.accent.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.accent.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
