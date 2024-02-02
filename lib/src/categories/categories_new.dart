import 'package:alc_book/src/app_update/app_update.dart';
import 'package:alc_book/src/categories/widgets/search_bar_widget.dart';
import 'package:alc_book/src/instructions/instructions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../about/about.dart';
import '../about/about_app.dart';
import '../constants/books.dart';
import '../constants/colors.dart';
import 'category_books.dart';
import 'category_form_download.dart';
import 'category_widget.dart';

class CategoriesNew extends StatefulWidget {
  const CategoriesNew({super.key});

  @override
  State<CategoriesNew> createState() => _CategoriesNewState();
}

class _CategoriesNewState extends State<CategoriesNew> {
  @override
  void initState() {
    AppUpdate.checkAppUpdate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              100.verticalSpace,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.r),
                      topRight: Radius.circular(35.r),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 25.w,
                      right: 25.w,
                      // bottom: 30.h,
                    ),
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
                        const SizedBox(height: 5),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                CategoryWidget(
                                  title: 'आत्मिक वृद्धि पुस्तकहरू',
                                  subtitle: 'Spiritual Growth Books',
                                  color: AppColors.red,
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
                                ),
                                CategoryWidget(
                                  title: 'आत्मिक परिपक्वता पुस्तकहरू',
                                  subtitle: 'Spiritual Maturity Books',
                                  color: AppColors.primary,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: CategoryBooks(
                                          title: 'आत्मिक परिपक्वता पुस्तकहरू '
                                              '(Spiritual Maturity Books)',
                                          books: BookList.list2,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                CategoryWidget(
                                  title: 'प्रभावकारी सुसमाचार सामग्रीहरू',
                                  subtitle: 'Effective Evangelism Materials',
                                  color: AppColors.yellow,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: CategoryBooks(
                                          title:
                                              'प्रभावकारी सुसमाचार सामग्रीहरू '
                                              '(Effective Evangelism Materials)',
                                          books: BookList.list3,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                CategoryWidget(
                                  title: 'नयाँ अनुसन्धान र पुस्तकहरु',
                                  subtitle: 'New research and books',
                                  color: AppColors.skyBlue,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: CategoryBooks(
                                          title: 'नयाँ अनुसन्धान र पुस्तकहरु '
                                              '(New research and books)',
                                          books: BookList.list4,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                CategoryWidget(
                                  title: 'प्रभावकारी अध्ययन बानी',
                                  subtitle: 'Effective Study Habits',
                                  color: AppColors.red,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: CategoryBooks(
                                          title: 'प्रभावकारी अध्ययन बानी '
                                              '(Effective Study Habits)',
                                          books: BookList.list5,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                // CategoryWidget(
                                //   title: 'नयाँ पुस्तकहरू तिमोथी अर्याल-२०८०',
                                //   subtitle: 'New Books Timothy Aryal-2080',
                                //   color: AppColors.primary,
                                //   onPressed: () {
                                //     Navigator.push(
                                //       context,
                                //       PageTransition(
                                //         type: PageTransitionType.rightToLeft,
                                //         child: CategoryBooks(
                                //           title:
                                //               'नयाँ पुस्तकहरू तिमोथी अर्याल-२०८० '
                                //               '(New Books Timothy Aryal-2080)',
                                //           books: BookList.list6,
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),
                                CategoryWidget(
                                  title: 'नेतृत्व र परामर्श कलेज',
                                  subtitle: 'Leadership and Counseling College',
                                  color: AppColors.grey,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: CategoryFormDownloads(
                                          title: 'नेतृत्व र परामर्श कलेज '
                                              '(Leadership and Counseling College)',
                                          books: BookList.listForms,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                // const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        SafeArea(
                          top: false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                  elevation: 0.0,
                                  color: AppColors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  child: Text(
                                    'About Dr. Timothy Aryal',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0,
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
                                      fontSize: 12.0,
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
                                MaterialButton(
                                  elevation: 0.0,
                                  color: AppColors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Donate',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: const Instructions(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SearchBarWidget(),
        ],
      ),
    );
  }
}
