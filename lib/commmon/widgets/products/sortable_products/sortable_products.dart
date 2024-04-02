import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/layouts/grid_layout.dart';
import 'package:t_store/commmon/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            "Popularity",
            "Highest to Lowest",
            "Lowest to Highest",
            "Sale",
            "New Arrivals"
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),

        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        TGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const TProductCardvertical())
      ],
    );
  }
}
