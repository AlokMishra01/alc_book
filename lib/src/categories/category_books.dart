import 'package:alc_book/src/book_pdf/book_pdf.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class CategoryBooks extends StatelessWidget {
  final String title;
  final List<BookModel> books;

  const CategoryBooks({
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
          child: Row(
            children: [
              CachedNetworkImage(
                placeholder: (_, __) => Container(
                  width: (width / 2) * 0.7,
                  height: width / 2,
                  color: AppColors.textTwo.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                    ),
                  ),
                ),
                imageUrl: books[i].cover,
                height: width / 2,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      books[i].name,
                      style: GoogleFonts.khand(
                        color: AppColors.textOne,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      books[i].author,
                      style: GoogleFonts.khand(
                        color: AppColors.red,
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
                        'पढ्नुहोस्',
                        style: GoogleFonts.khand(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
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
                      },
                    ),
                  ],
                ),
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
