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
import 'package:ulearning_app/features/sign_in/provider/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/controller/sign_in_controller.dart';
import 'package:ulearning_app/features/sign_in/view/widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    _controller = SignInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(signInProvider.email);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: 'Log In'),
      body: loader == false
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // top login buttons
                    thirdPartyLogin(),
                    // more login actions message
                    const Center(
                      child: Text14Normal(
                        text: 'Or use your email account to login',
                      ),
                    ),
                    SizedBox(height: 50.h),
                    // email text box
                    appTextField(
                      controller: _controller.emailController,
                      text: 'Email',
                      iconName: ImageRes.user,
                      hintText: 'Enter your email address',
                      func: (value) => ref
                          .read(signInNotifierProvider.notifier)
                          .onUserEmailChange(value),
                    ),
                    SizedBox(height: 20.h),
                    // password text box
                    appTextField(
                      controller: _controller.passwordController,
                      text: 'Password',
                      iconName: ImageRes.lock,
                      hintText: 'Enter your password',
                      obscureText: true,
                      func: (value) => ref
                          .read(signInNotifierProvider.notifier)
                          .onUserPasswordChange(value),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: textUnderline(text: 'Forgot password?'),
                    ),
                    SizedBox(height: 100.h),
                    // app login button
                    Center(
                        child: appButton(
                      buttonName: 'Login',
                      context: context,
                      func: () => _controller.handleSignIn(ref),
                    )),
                    SizedBox(height: 20.h),
                    // app register button
                    Center(
                      child: appButton(
                        buttonName: "Register",
                        isLogin: false,
                        context: context,
                        func: () {
                          Navigator.pushNamed(context, '/register');
                        },
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
