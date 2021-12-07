import 'package:alc_book/src/book_pdf/book_pdf.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class CategoryFormDownloads extends StatelessWidget {
  final String title;
  final List<BookModel> books;

  const CategoryFormDownloads({
    Key? key,
    required this.title,
    this.books = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
          title,
          style: GoogleFonts.khand(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 16.0, bottom: 120.0),
        itemBuilder: (_, i) => Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.backgroundAlt,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                books[i].name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textOne,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                books[i].author,
                style: TextStyle(
                  color: AppColors.textOne,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
              MaterialButton(
                elevation: 0.0,
                color: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Text(
                  'View',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: BookPDF(
                        title: title,
                        book: books[i],
                      ),
                    ),
                  );
                  // launch(books[i].book);
                },
              ),
            ],
          ),
        ),
        separatorBuilder: (_, i) => const SizedBox(height: 24.0),
        itemCount: books.length,
      ),
    );
  }
}
