import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../book_pdf/book_pdf.dart';
import '../../constants/colors.dart';
import '../../models/book_model.dart';

class SearchBarPreview extends StatelessWidget {
  const SearchBarPreview({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: BookPDF(
              title: book.name,
              book: book,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.backgroundAlt,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  placeholder: (_, __) => Container(
                    width: (width / 2) * 0.7,
                    height: width / 2,
                    color: AppColors.textTwo.withOpacity(0.5),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ),
                  imageUrl: book.cover,
                  height: width / 2,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              book.name,
                              style: GoogleFonts.khand(
                                color: AppColors.red,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          book.author,
                          style: GoogleFonts.khand(
                            color: AppColors.textOne,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
