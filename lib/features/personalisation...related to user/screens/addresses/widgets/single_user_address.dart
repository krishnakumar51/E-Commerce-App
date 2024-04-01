import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSingleUserAddress extends StatelessWidget {
  const TSingleUserAddress({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          selected ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selected
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Icon(
              selected ? Iconsax.tick_circle5 : null,
              color: selected
                  ? dark
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Name",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              const Text(
                "+91 85224 92621",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              const Text(
                "Khalsa Accomodation , Star City Colony, Mohali, Punjab ",
                softWrap: true,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              const Text(
                "Pin Code: 140301  ",
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
