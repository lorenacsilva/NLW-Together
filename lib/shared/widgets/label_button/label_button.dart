import 'package:counter_app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle style;
  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.style,
  }) : super(key: key);

  factory LabelButton.heading(
          {required String label, required VoidCallback onPressed}) =>
      LabelButton(
        label: label,
        onPressed: onPressed,
        style: TextStyles.buttonHeading,
      );

  factory LabelButton.primary(
          {required String label, required VoidCallback onPressed}) =>
      LabelButton(
        label: label,
        onPressed: onPressed,
        style: TextStyles.buttonPrimary,
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: style,
        ),
      ),
    ));
  }
}
