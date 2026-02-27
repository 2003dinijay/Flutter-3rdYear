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

class SocialSignInButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final double height;

  const SocialSignInButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.fieldBorder, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20, height: 20, child: icon),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
