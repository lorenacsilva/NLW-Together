import 'package:counter_app/shared/themes/app_colors.dart';
import 'package:counter_app/shared/themes/app_images.dart';
import 'package:counter_app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback ontap;
  const SocialLoginButton({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //widget para on tap
      onTap: ontap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(BorderSide(
              color: AppColors.stroke,
            ))),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.google),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 56,
                      width: 1,
                      color: AppColors.stroke,
                    )
                  ],
                )),
            Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Entrar com Google",
                      style: TextStyles.buttonGray,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
