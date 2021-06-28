import 'package:counter_app/shared/themes/app_colors.dart';
import 'package:counter_app/shared/themes/app_text_styles.dart';
import 'package:counter_app/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BottonSheetWidget extends StatelessWidget {
  final String PrimaryLabel;
  final VoidCallback primaryOnPressed;
  final String SecondaryLabel;
  final VoidCallback SecondaryOnPressed;
  final String title;
  final String subtitle;

  const BottonSheetWidget(
      {Key? key,
      required this.PrimaryLabel,
      required this.primaryOnPressed,
      required this.SecondaryLabel,
      required this.SecondaryOnPressed,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.buttonBoldHeading,
                            children: [
                              TextSpan(
                                  text: "\n$subtitle",
                                  style: TextStyles.buttonHeading)
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      labelPrimary: PrimaryLabel,
                      onTapPrimary: SecondaryOnPressed,
                      labelSecondary: SecondaryLabel,
                      onTapSecondary: SecondaryOnPressed,
                    ),
                    SizedBox(height: 2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
