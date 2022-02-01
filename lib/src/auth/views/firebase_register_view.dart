import 'dart:developer';

import 'package:alc_book/src/categories/categories.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseRegisterView extends StatefulWidget {
  const FirebaseRegisterView({Key? key}) : super(key: key);

  @override
  State<FirebaseRegisterView> createState() => _FirebaseAuthRegisterState();
}

class _FirebaseAuthRegisterState extends State<FirebaseRegisterView> {
  final _fullName = TextEditingController();
  final _mobile = TextEditingController();
  final _email = TextEditingController();
  final _country = TextEditingController();
  final _password = TextEditingController();
  final _conPassword = TextEditingController();
  String? _gender;
  String? _account;

  bool _isSaved = false;
  bool _saving = false;

  @override
  void dispose() {
    _fullName.dispose();
    _mobile.dispose();
    _email.dispose();
    _country.dispose();
    _password.dispose();
    _conPassword.dispose();
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
              children: [
                const SizedBox(height: 36.0),
                Text(
                  'Register',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 36.0),
                TextFormField(
                  controller: _fullName,
                  textCapitalization: TextCapitalization.words,
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
                      'Name',
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
                    if (value!.length < 2) {
                      return 'Name Should Have At Least 3 Characters';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
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
                  controller: _mobile,
                  keyboardType: TextInputType.phone,
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
                      'Phone Number',
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
                    if (value!.length != 10) {
                      return 'Phone Should Have At Least 10 Numbers';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _gender,
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text(
                        'Male',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text(
                        'Female',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Others',
                      child: Text(
                        'Others',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  isExpanded: true,
                  onChanged: (v) {
                    _gender = v;
                    setState(() {});
                  },
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
                      'Gender',
                    ),
                    hintText: 'Select Gender From List',
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
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _country,
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
                      'Country',
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
                    if (value!.length < 2) {
                      return 'Country Should Have At Least 3 Characters';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
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
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _conPassword,
                  keyboardType: TextInputType.text,
                  obscureText: true,
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
                      'Confirm Password',
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
                    if ((value ?? '') != _password.text) {
                      return 'Password do not match.';
                    }
                  },
                ),
                const SizedBox(height: 24.0),
                Divider(
                  color: AppColors.primary,
                  thickness: 2.0,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Please select by which Bank you have paid the Royalty:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _account,
                  items: const [
                    DropdownMenuItem(
                      value: 'Deesis Aryal, '
                          'Rastriya Banijya Bank, '
                          'A/C No: 1150100043134010',
                      child: Text(
                        'Deesis Aryal, Rastriya Banijya Bank\n'
                        'A/C No: 1150100043134010',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Deesis Aryal, '
                          'Nepal Investment Bank, '
                          'A/C No: 01705080076526',
                      child: Text(
                        'Deesis Aryal, Nepal Investment Bank\n'
                        'A/C No: 01705080076526',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Tara Aryal, '
                          'Nepal SBI Bank Ltd., '
                          'A/C No: 21515243400328',
                      child: Text(
                        'Tara Aryal, Nepal SBI Bank Ltd.\n'
                        'A/C No: 21515243400328',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  isExpanded: true,
                  onChanged: (v) {
                    _account = v;
                    setState(() {});
                  },
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
                      'Account',
                    ),
                    hintText: 'Select Account From List',
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
                ),
                const SizedBox(height: 16.0),
                Divider(
                  color: AppColors.primary,
                  thickness: 2.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Please send us a picture of an online payment receipt or '
                  'cash deposited bank receipt by:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: AppColors.textTwo,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            'Email: aryaltimothy77@gmail.com ',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: AppColors.textTwo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: AppColors.textTwo,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            'Viber/WhatsApp/Messenger: +977-9840841486',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: AppColors.textTwo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Divider(
                  color: AppColors.primary,
                  thickness: 2.0,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'If any problem please call us : '
                  '+977-9840841486  or mail us.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.textTwo,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Please wait for a few days for verification. Thanks.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
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
                          'Submit',
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
                    onPressed: _register,
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
                      'Login',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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

  _register() async {
    if (_fullName.text.length < 2) {
      return;
    }
    bool b = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(_email.text);
    if (!b) {
      return;
    }
    if (_mobile.text.length != 10) {
      return;
    }
    if (_country.text.length < 2) {
      return;
    }
    if (_password.text.length < 6) {
      return;
    }
    if (_conPassword.text != _password.text) {
      return;
    }

    _saving = true;
    setState(() {});
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      final f = FirebaseFirestore.instance;
      await f.collection('users').doc('${userCredential.user?.email!}').set({
        'fullName': _fullName.text,
        'phone': _mobile.text,
        'email': _email.text,
        'gender': _gender,
        'country': _country.text,
        'account': _account,
        'status': false,
      });
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
          child: const Categories(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      _saving = false;
      setState(() {});
    } catch (e, s) {
      log('Firebase Store Error!', error: e, stackTrace: s);
      _saving = false;
      setState(() {});
    }
  }
}
