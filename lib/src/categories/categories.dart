import 'package:alc_book/src/about/about.dart';
import 'package:alc_book/src/about/about_app.dart';
import 'package:alc_book/src/categories/category_books.dart';
import 'package:alc_book/src/categories/category_form_download.dart';
import 'package:alc_book/src/constants/books.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Text(
                'Select Category',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: (width / 2) - 24.0,
                              child: InkWell(
                                onTap: () {
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
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteAlt,
                                  radius: (width / 4) - 12.0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'आत्मिक बृद्घि पुस्तकहरू',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.khand(
                                              color: AppColors.primary,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              height: 1.1,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              'Spiritual Growth Books',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                height: 1.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            SizedBox(
                              width: (width / 2) - 24.0,
                              child: InkWell(
                                onTap: () {
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
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteAlt,
                                  radius: (width / 4) - 12.0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'आत्मिक परिपक्वता पुस्तकहरू',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.khand(
                                              color: AppColors.primary,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              height: 1.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              'Spiritual Maturity Books',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                height: 1.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 16.0),
                            SizedBox(
                              width: (width / 2) - 24.0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: CategoryBooks(
                                        title: 'प्रभावकारी सुसमाचार सामग्रीहरू '
                                            '(Effective Evangelism Materials)',
                                        books: BookList.list3,
                                      ),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteAlt,
                                  radius: (width / 4) - 12.0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'प्रभावकारी सुसमाचार सामग्रीहरू',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.khand(
                                              color: AppColors.primary,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              height: 1.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              'Effective Evangelism Materials',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                height: 1.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: (width / 2) - 24.0,
                              child: InkWell(
                                onTap: () {
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
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteAlt,
                                  radius: (width / 4) - 12.0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'नेतृत्व र परामर्श कलेज',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.khand(
                                              color: AppColors.primary,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              height: 1.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              'Leadership and Counseling College',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                height: 1.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            SizedBox(
                              width: (width / 2) - 24.0,
                              child: InkWell(
                                onTap: () {
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
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteAlt,
                                  radius: (width / 4) - 12.0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'नयाँ अनुसन्धान र पुस्तकहरु',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.khand(
                                              color: AppColors.primary,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              height: 1.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              'New research and books',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                height: 1.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
    );
  }
}
