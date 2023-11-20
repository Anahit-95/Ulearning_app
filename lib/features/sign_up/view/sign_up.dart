import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_up/provider/register_notifier.dart';

import 'package:ulearning_app/features/sign_up/controller/sign_up_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: 'Sign Up'),
      body: loader == false
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    // more login actions message
                    Center(
                      child: text14Normal(
                        text: 'Enter your details below & free sign up',
                      ),
                    ),
                    SizedBox(height: 50.h),
                    // Username text box
                    appTextField(
                      text: 'User name',
                      iconName: ImageRes.user,
                      hintText: 'Enter your user name',
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserNameChange(value),
                    ),
                    SizedBox(height: 20.h),
                    // email text box
                    appTextField(
                      text: 'Email',
                      iconName: ImageRes.user,
                      hintText: 'Enter your email address',
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserEmailChange(value),
                    ),
                    SizedBox(height: 20.h),
                    // password text box
                    appTextField(
                      text: 'Password',
                      iconName: ImageRes.lock,
                      hintText: 'Enter your password',
                      obscureText: true,
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserPasswordChange(value),
                    ),
                    SizedBox(height: 20.h),
                    // confirm password text box
                    appTextField(
                      text: 'Confirm your password',
                      iconName: ImageRes.lock,
                      hintText: 'Confirm your password',
                      obscureText: true,
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserRePasswordChange(value),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: text14Normal(
                        text:
                            'By creating an account you are agreeng with our terms and conditions',
                      ),
                    ),
                    SizedBox(height: 100.h),
                    // app register button
                    Center(
                      child: appButton(
                        buttonName: "Sign Up",
                        isLogin: true,
                        context: context,
                        func: () => _controller.handleSignUp(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                color: AppColors.primaryElement,
              ),
            ),
    );
  }
}