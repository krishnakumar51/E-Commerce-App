import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commmon/widgets/products/ratings/product_rating_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(
                "4.6",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const TRatingBarIndicator(
                rating: 4.6,
              ),
              Text(
                "(1,204)",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                value: 0.8,
                text: '5',
              ),
              TRatingProgressIndicator(
                value: 0.5,
                text: '4',
              ),
              TRatingProgressIndicator(
                value: 0.3,
                text: '3',
              ),
              TRatingProgressIndicator(
                value: 0.1,
                text: '2',
              ),
              TRatingProgressIndicator(
                value: 0.1,
                text: '1',
              ),
            ],
          ),
        )
      ],
    );
  }
}
