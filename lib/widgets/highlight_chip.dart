import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HighlightChip extends StatelessWidget {
  final String label;

  const HighlightChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: AppSpacing.sm,
        bottom: AppSpacing.sm,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accent),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        color: AppColors.accent.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: AppColors.accent,
            size: AppIconSize.sm,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: AppTextStyles.chip,
          ),
        ],
      ),
    );
  }
}