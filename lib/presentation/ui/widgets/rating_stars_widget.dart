import 'package:flutter/material.dart';
import 'package:products_coodesh/presentation/ui/theme/design_system.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  const RatingStars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconTheme(
          data: const IconThemeData(
            color: DS.starsRatingColor,
          ),
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
          ),
        );
      }),
    );
  }
}
