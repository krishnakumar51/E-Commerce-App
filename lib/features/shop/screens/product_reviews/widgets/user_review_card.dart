import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/commmon/widgets/cutom_shapes/containers/rounded_container.dart';
import 'package:t_store/commmon/widgets/products/ratings/product_rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  "User Name1",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              "01 Mar, 2024",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        const ReadMoreText(
          "This is the description of the Nike product of which you are displying here, it can maximum go for about 2 lines , as and when more detailas a re added it will show option for showing less and showing more",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: "Show less",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: TSizes.md,
        ),

        //  company's reply for the review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "02 Mar, 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  "This is the description of the Nike product of which you are displying here, it can maximum go for about 2 lines , as and when more detailas a re added it will show option for showing less and showing more",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show more",
                  trimExpandedText: "Show less",
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        )
      ],
    );
  }
}
