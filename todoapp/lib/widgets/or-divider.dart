import 'package:flutter/material.dart';

class AppColors {
  static const tealStart = Color(0xFF38B2AC);
  static const tealEnd = Color(0xFF2DD4BF);
  static const fieldBorder = Color(0xFFE2E8F0);
  static const fieldIcon = Color(0xFF94A3B8);
  static const textPrimary = Color(0xFF1E293B);
  static const textHint = Color(0xFF94A3B8);
  static const textSecondary = Color(0xFF64748B);
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.fieldBorder)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.fieldBorder)),
      ],
    );
  }
}
