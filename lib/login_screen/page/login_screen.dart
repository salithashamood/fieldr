import 'package:fieldr/login_screen/login_screen_components.dart';
import 'package:fieldr/login_screen/login_screen_providers.dart';
import 'package:fieldr/utils/colors.dart';
import 'package:fieldr/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 100.h,
            width: 100.w,
            color: mainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                emptySized(10.h, 0),
                Image.asset(appLogo),
                emptySized(10.h, 0),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: loginState.setScreen(loginState),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
