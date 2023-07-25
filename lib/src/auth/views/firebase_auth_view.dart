import 'dart:developer';

import 'package:alc_book/src/categories/categories.dart';
import 'package:alc_book/src/categories/categories_new.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_register_view.dart';

class FirebaseAuthView extends StatefulWidget {
  const FirebaseAuthView({Key? key}) : super(key: key);

  @override
  State<FirebaseAuthView> createState() => _FirebaseAuthViewState();
}

class _FirebaseAuthViewState extends State<FirebaseAuthView> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _showPassword = false;

  bool _isSaved = false;
  bool _saving = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 36.0),
                Text(
                  'Login',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 36.0),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    label: const Text(
                      'Email',
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    bool b = RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                    ).hasMatch(value ?? '');
                    if (!b) {
                      return 'Please enter valid email.';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _password,
                  keyboardType: TextInputType.text,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    label: const Text(
                      'Password',
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Password Should Have At Least 6 Characters';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _showPassword,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        _showPassword = value ?? false;
                        setState(() {});
                      },
                    ),
                    const Text(
                      'Show Password',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36.0),
                if (!_isSaved && !_saving)
                  MaterialButton(
                    elevation: 0.0,
                    color: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 48.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.white,
                        )
                      ],
                    ),
                    onPressed: _login,
                  ),
                const SizedBox(height: 24.0),
                if (!_isSaved && !_saving)
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Divider(
                          color: AppColors.primary,
                          thickness: 2.0,
                        ),
                      ),
                      const Text(
                        ' Or ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Divider(
                          color: AppColors.primary,
                          thickness: 2.0,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 24.0),
                if (!_isSaved && !_saving)
                  MaterialButton(
                    elevation: 0.0,
                    color: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 48.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const FirebaseRegisterView(),
                        ),
                      );
                    },
                  ),
                if (!_isSaved && !_saving) const SizedBox(height: 24.0),
                if (!_isSaved && !_saving)
                  MaterialButton(
                    elevation: 0.0,
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 48.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                if (!_isSaved && _saving)
                  CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                if (!_isSaved) const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    bool b = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(_email.text);
    if (!b) {
      return;
    }
    if (_password.text.length < 6) {
      return;
    }
    _saving = true;
    setState(() {});
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      _isSaved = true;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setBool('logged', true);
      await preferences.setString('user', _email.text);
      _saving = false;
      setState(() {});
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const CategoriesNew(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      _saving = false;
      setState(() {});
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e, s) {
      log('Firebase Store Error!', error: e, stackTrace: s);
      _saving = false;
      setState(() {});
    }
  }
}
