import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryShimmers extends StatelessWidget {
  const TCategoryShimmers({super.key, this.itemCount = 6});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                TShimmerEffect(
                  widht: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

                // text
                TShimmerEffect(
                  widht: 55,
                  height: 8,
                )
              ],
            );
          }),
    );
  }
}
