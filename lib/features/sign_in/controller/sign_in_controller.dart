import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/contsants.dart';
import 'package:ulearning_app/common/utils/popup_messages.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/sign_in/provider/sign_in_notifier.dart';
import 'package:ulearning_app/main.dart';

class SignInController {
  // WidgetRef ref;

  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    print('My email is $email');
    print('My password is $password');

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo('Your email is empty');
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo('Your password is empty');
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo('User not found');
        return;
      }

      if (!credential.user!.emailVerified) {
        toastInfo('You must verify your email address first !');
        return;
      }
      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;

        asyncPostAllData(loginRequestEntity);
        if (kDebugMode) {
          print('user logged in');
        }
      } else {
        toastInfo('Login Error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo("User not found");
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        toastInfo('Your email or password are wrong');
      } else if (e.code == 'wrong-password') {
        toastInfo('Your password is wrong');
      }
      print('The error code is ${e.code}');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // we need to talk to server
    var result = await SignInRepo.login(params: loginRequestEntity);

    if (result.code == 200) {
      // have local storage
      try {
        // try to remember user info
        Global.storageService.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY,
          jsonEncode(result.data),
        );
        Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY,
          result.data!.access_token!,
        );

        navKey.currentState
            ?.pushNamedAndRemoveUntil('/application', (route) => false);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    } else {
      toastInfo('Login error');
    }
  }
}
