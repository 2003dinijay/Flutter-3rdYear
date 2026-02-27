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

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final double? width;
  final double height;
  final Widget? icon; // optional leading icon
  final List<Color>? gradient; // override gradient if needed

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.width = double.infinity,
    this.height = 54,
    this.icon,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final bool active = !isDisabled && !isLoading && onPressed != null;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: active ? 1.0 : 0.55,
      child: GestureDetector(
        onTap: active ? onPressed : null,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors:
                  gradient ??
                  [const Color(0xFF66E9F2), const Color(0xFF5DC580)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: const Color(0xFF38B2AC).withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null) ...[icon!, const SizedBox(width: 8)],
                      Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
