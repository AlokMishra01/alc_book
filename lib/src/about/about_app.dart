import 'dart:io';

import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/splash/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  bool status = true;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  _checkStatus() async {
    final data = await FirebaseFirestore.instance
        .collection('iOSReview')
        .doc('inReview')
        .get();
    status = data.get('status') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.red,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.arrow_left,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'About App',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          if (!status || !Platform.isIOS)
            PopupMenuButton(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              onSelected: (value) async {
                switch (value) {
                  case 1:
                    await FirebaseAuth.instance.signOut();
                    final pref = await SharedPreferences.getInstance();
                    await pref.setBool('logged', false);
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const Splash(),
                      ),
                      (route) => false,
                    );
                }
              },
              itemBuilder: (cxt) => [
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: AppColors.textTwo,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity, height: 12.0),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'A special thank goes to ',
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Subash Thapa, Daniel Thapa, ',
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // TextSpan(
                      //   text: 'Friend of Daniel, ',
                      //   style: TextStyle(
                      //     color: AppColors.textTwo,
                      //     fontSize: 14.0,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                      TextSpan(
                        text: 'Alok Mishra, Ps. Dambar G. Magar, Lusan Man Mane'
                            ', and all intercessors of Abundant Life Church.',
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: double.infinity, height: 24.0),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Visit our Website: ',
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'PJC NEPAL',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch('https://pjcnepal.org/'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: double.infinity, height: 24.0),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'For more Spiritual materials e.g., songs, '
                            'dance by the worship team of Abundant Life '
                            'Church are available on: ',
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Living Hope Nepal',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(
                                'https://www.youtube.com/c/LIVINGHOPEJESUS',
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: double.infinity, height: 24.0),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Life testimony and audiobooks by '
                            'Timothy Aryal available on: ',
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Dr.Timothy Aryal',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(
                                'https://www.youtube.com/c/DrTimothyAryalPJCNEPAL',
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: double.infinity, height: 24.0),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Link for best-selling Biblical and '
                            'Psychological books by Timothy Aryal and '
                            'Published by EKTA BOOKS: ',
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Ektabooks',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(
                                'https://www.ektabooks.com/',
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
