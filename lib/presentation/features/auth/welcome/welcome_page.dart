import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/utils.dart';

import '../../../language/locale_keys.g.dart';
import '../../../route/router.dart';
import '../../../theme/theme.dart';
import '../../../widgets/atom/assets_gen/assets.gen.dart';
import '../../../widgets/atom/assets_gen/fonts.gen.dart';
import '../../../widgets/atom/button/button.dart';
import '../../../widgets/atom/text_view.dart';

class WelcomePage extends HookWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(child: SizedBox(height: 3.h)),
              TextView(
                LocaleKeys.welcome.tr().toUpperCase(),
                fontSize: FontSize.massive,
                fontFamily: FontFamily.rotunda,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 3.h),
              Assets.svgs.chat.svg(
                height: 60.h,
              ),
              SizedBox(height: 3.h),
              SizedBox(
                width: 70.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Button(
                      LocaleKeys.login.tr().toUpperCase(),
                      buttonSize: ButtonSize.infinityWith,
                      onPressed: () {
                        AppRouter().push(const LoginRoute());
                      },
                    ),
                    SizedBox(height: 2.h),
                    Button(
                      LocaleKeys.signUp.tr().toUpperCase(),
                      buttonType: ButtonType.primaryLight,
                      buttonSize: ButtonSize.infinityWith,
                      onPressed: () {
                        AppRouter().push(const SignUpRoute());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Background extends HookWidget {
  const _Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

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
            child: Assets.images.mainTop.image(
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
