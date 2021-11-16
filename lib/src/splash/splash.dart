import 'package:alc_book/src/constants/images.dart';
import 'package:alc_book/src/our_books/our_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/colors.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Images.splash),
                  const SizedBox(width: double.infinity, height: 16.0),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: AppColors.textTwo,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: double.infinity, height: 8.0),
                  Text(
                    'You are welcome to our Spiritual Books and Resources app.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textTwo,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: double.infinity, height: 12.0),
                  Text(
                    'All books by',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textTwo,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Timothy Aryal',
                    style: TextStyle(
                      color: AppColors.textTwo,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: MaterialButton(
                elevation: 0.0,
                color: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minWidth: double.infinity,
                child: Text(
                  'Get Started',
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
                      child: const OurBook(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
