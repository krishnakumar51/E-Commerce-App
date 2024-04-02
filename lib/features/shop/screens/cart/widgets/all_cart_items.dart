import 'package:flutter/material.dart';
import 'package:t_store/commmon/widgets/products/products_cart/add_remove_button.dart';
import 'package:t_store/commmon/widgets/products/products_cart/cart_item.dart';
import 'package:t_store/commmon/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TAllCArtItems extends StatelessWidget {
  const TAllCArtItems({
    super.key,
    this.showAddRemovebuttons = true,
  });

  final bool showAddRemovebuttons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if (showAddRemovebuttons)
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          if (showAddRemovebuttons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    // add remove button
                    TProductQuantityWithAddAndRemove(),
                  ],
                ),
                TProductPriceText(price: "256"),
              ],
            ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const Divider(
            color: Colors.grey, // Change the color to fit your design
            thickness: 1, // Adjust thickness as needed
            height: 5,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
