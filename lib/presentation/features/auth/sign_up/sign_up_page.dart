import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/const/constants.dart';
import '../../../language/locale_keys.g.dart';
import '../../../route/router.dart';
import '../../../theme/theme.dart';
import '../../../widgets/atom/assets_gen/assets.gen.dart';
import '../../../widgets/atom/assets_gen/fonts.gen.dart';
import '../../../widgets/atom/button/button.dart';
import '../../../widgets/atom/text_area/obscure_text_area.dart';
import '../../../widgets/atom/text_area/text_area.dart';
import '../../../widgets/atom/text_view.dart';
import '../widgets/already_have_an_account_acheck.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(child: SizedBox(height: 3.h)),
              TextView(
                LocaleKeys.signUp.tr().toUpperCase(),
                fontSize: FontSize.massive,
                fontFamily: FontFamily.rotunda,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 3.h),
              Assets.svgs.signup.svg(
                width: 70.w,
              ),
              SizedBox(height: 3.h),
              SizedBox(
                width: 70.w,
                child: Column(
                  children: [
                    TextArea(
                      onSaved: (value) {},
                      hintText: LocaleKeys.email.tr(),
                      labelText: LocaleKeys.email.tr(),
                      isRequired: true,
                      textLightColor: AppColors.violet,
                      textType: TextType.email,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      borderRadius: 26,
                      filled: true,
                      fillColor: AppColors.violet[50],
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColors.violet,
                          size: kWideIconSize,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    ObscureTextArea(
                      onSaved: (value) {},
                      hintText: LocaleKeys.password.tr(),
                      labelText: LocaleKeys.password.tr(),
                      isRequired: true,
                      textLightColor: AppColors.violet,
                      textType: TextType.password,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      borderRadius: 26,
                      filled: true,
                      fillColor: AppColors.violet[50],
                      textInputAction: TextInputAction.done,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                        ),
                        child: Icon(
                          Icons.lock,
                          color: AppColors.violet,
                          size: kWideIconSize,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    LoadingButton(
                      LocaleKeys.signUp.tr().toUpperCase(),
                      buttonType: ButtonType.primaryLight,
                      buttonSize: ButtonSize.infinityWith,
                      onPressed: () async {
                        await Future.delayed(const Duration(seconds: 3));
                        AppRouter().replaceAll(const [HomeRoute()]);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              AlreadyHaveAnAccountCheck(
                isLogin: false,
                onTap: () {
                  AppRouter().replace(const LoginRoute());
                },
              ),
              _OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _SocialIcon(
                    iconSrc: Assets.svgs.facebook.path,
                    onTap: () {},
                  ),
                  _SocialIcon(
                    iconSrc: Assets.svgs.twitter.path,
                    onTap: () {},
                  ),
                  _SocialIcon(
                    iconSrc: Assets.svgs.googlePlus.path,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 3.h)
            ],
          ),
        ),
      ),
    );
  }
}

class _Background extends HookWidget {
  final Widget child;

  const _Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Assets.images.signupTop.image(
              width: 16.h,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Assets.images.mainBottom.image(
              width: 8.h,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _OrDivider extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      width: 80.w,
      child: Row(
        children: <Widget>[
          _buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultExThinPadding,
            ),
            child: TextView(
              LocaleKeys.or.tr(),
              fontWeight: FontWeight.w600,
              fontColor: AppColors.violet,
            ),
          ),
          _buildDivider(),
        ],
      ),
    );
  }

  Expanded _buildDivider() {
    return Expanded(
      child: Divider(
        color: AppColors.violet[300]!,
        height: 1.5,
      ),
    );
  }
}

class _SocialIcon extends HookWidget {
  const _SocialIcon({
    Key? key,
    required this.iconSrc,
    this.onTap,
  }) : super(key: key);

  final String iconSrc;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultExThinPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: AppColors.violet[100]!,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: kFatIconSize,
          width: kFatIconSize,
        ),
      ),
    );
  }
}
