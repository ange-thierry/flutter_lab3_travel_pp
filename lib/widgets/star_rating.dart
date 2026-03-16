import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;

  const StarRating({
    Key? key,
    required this.rating,
    this.size = AppIconSize.md,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final filled = rating - index;
        final IconData icon;

        if (filled >= 1) {
          icon = Icons.star;
        } else if (filled > 0) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }

        return Icon(icon, color: AppColors.star, size: size);
      }),
    );
  }
}