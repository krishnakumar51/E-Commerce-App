import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/enums.dart';

class TBrandTitileText extends StatelessWidget {
  const TBrandTitileText({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.color,
    this.textAlign,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelLarge!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
