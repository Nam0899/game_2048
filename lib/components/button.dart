import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_2048/utilities/colors.dart';

class ButtonWidget extends ConsumerWidget {
  const ButtonWidget({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
  });

  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (icon != null) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.kColorSecondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          color: Colors.white,
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 24,
          ),
        ),
      );
    }
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(
            16,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          AppColors.kColorButton,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
