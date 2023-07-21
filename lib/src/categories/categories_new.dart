import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../about/about.dart';
import '../about/about_app.dart';
import '../constants/books.dart';
import '../constants/colors.dart';
import 'category_books.dart';

class CategoryNew extends StatelessWidget {
  const CategoryNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 20, left: 30, right: 30),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.3),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Search songs',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: GoogleFonts.raleway(
                          fontSize: 30,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          CategoryWidget(
                            title: 'आत्मिक वृद्धि पुस्तकहरू',
                            subtitle: 'Spiritual Growth Books',
                            color: AppColors.red,
                          ),
                          CategoryWidget(
                            title: 'आत्मिक परिपक्वता पुस्तकहरू',
                            subtitle: 'Spiritual Maturity Books',
                            color: AppColors.primary,
                          ),
                          CategoryWidget(
                            title: 'प्रभावकारी सुसमाचार सामग्रीहरू',
                            subtitle: 'Effective Evangelism Materials',
                            color: AppColors.yellow,
                          ),
                          CategoryWidget(
                            title: 'नेतृत्व र परामर्श कलेज',
                            subtitle: 'Leadership and Counseling College',
                            color: AppColors.grey,
                          ),
                          CategoryWidget(
                            title: 'नयाँ अनुसन्धान र पुस्तकहरु',
                            subtitle: 'New research and books',
                            color: AppColors.skyBlue,
                          ),
                          CategoryWidget(
                            title: 'आत्मिक वृद्धि पुस्तकहरू',
                            subtitle: 'Spiritual Growth Books',
                            color: AppColors.red,
                          ),
                          CategoryWidget(
                            title: 'आत्मिक परिपक्वता पुस्तकहरू',
                            subtitle: 'Spiritual Maturity Books',
                            color: AppColors.primary,
                          ),
                          CategoryWidget(
                            title: 'प्रभावकारी सुसमाचार सामग्रीहरू',
                            subtitle: 'Effective Evangelism Materials',
                            color: AppColors.yellow,
                          ),
                          CategoryWidget(
                            title: 'नेतृत्व र परामर्श कलेज',
                            subtitle: 'Leadership and Counseling College',
                            color: AppColors.grey,
                          ),
                          CategoryWidget(
                            title: 'नयाँ अनुसन्धान र पुस्तकहरु',
                            subtitle: 'New research and books',
                            color: AppColors.skyBlue,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            elevation: 0.0,
                            color: AppColors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            child: Text(
                              'About Dr. Timothy Aryal',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const About(),
                                ),
                              );
                            },
                          ),
                          MaterialButton(
                            elevation: 0.0,
                            color: AppColors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            child: Text(
                              'About App',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const AboutApp(),
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
            ),
          )
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.title,
    this.subtitle = '',
    this.color = const Color(0xFF126196),
    super.key,
  });

  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: color,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: CategoryBooks(
                    title: 'आत्मिक बृद्घि पुस्तकहरू '
                        '(Spiritual Growth Books)',
                    books: BookList.list1,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 12.0, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.raleway(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Expanded(
                    child: Text(subtitle,
                        style: GoogleFonts.raleway(
                            fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
