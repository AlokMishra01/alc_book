import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../categories/categories.dart';
import '../categories/categories_new.dart';

class OurBook extends StatelessWidget {
  const OurBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36.0,
                vertical: 24.0,
              ),
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
                  'Our Books',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book12,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book11,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book10,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book9,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book8,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book7,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book6,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book4,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book5,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book3,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book2,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book1,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book18,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book17,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book26,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book16,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book15,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book14,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book13,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book23,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book24,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book25,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book27,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: CachedNetworkImage(
                              placeholder: (_, __) => Container(
                                width: (width / 3) - 88,
                                height: ((width / 3) - 28.0) * 1.4,
                                color: AppColors.textTwo.withOpacity(0.5),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              imageUrl: Images.book22,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36.0,
                vertical: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    color: AppColors.primary,
                    iconSize: 28.0,
                    icon: const Icon(
                      CupertinoIcons.arrow_left,
                    ),
                  ),
                  MaterialButton(
                    elevation: 0.0,
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.0),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const CategoriesNew(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
