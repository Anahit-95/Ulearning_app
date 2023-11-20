import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/popup_messages.dart';
import 'package:ulearning_app/features/sign_up/provider/register_notifier.dart';
import 'package:ulearning_app/features/sign_up/repo/sign_up_repo.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

    print("Your name is $name");
    print("Your email is $email");
    print("Your password is $password");
    print("Your rePassword is $rePassword");

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo('Your name is empty');
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo('Your name is too short');
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo('Your email is empty');
      return;
    }

    if (!state.email.contains('@') || !state.email.contains('.')) {
      toastInfo('Your email is not valid');
      return;
    }

    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    // if (state.password.length < 6 || password.length < 6) {
    //   toastInfo('Your password is too short');
    //   return;
    // }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("Your password does not match");
      return;
    }

    // show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);

    try {
      final credential = await SignUpRepo.firebaseSignUp(email, password);
      if (kDebugMode) {
        print(credential);
      }
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);

        toastInfo('An email has been sent to verify your account. '
            'Please open that email and confirm your identity.');
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo("This password is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo("This email address has already been registered");
      } else if (e.code == 'user-not-found') {
        toastInfo("User not found");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}