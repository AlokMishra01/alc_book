import 'dart:developer';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPDF extends StatefulWidget {
  final String title;
  final BookModel book;

  const BookPDF({
    Key? key,
    required this.title,
    required this.book,
  }) : super(key: key);

  @override
  State<BookPDF> createState() => _BookPDFState();
}

class _BookPDFState extends State<BookPDF> {
  bool _isLoading = true;
  late PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    try {
      _document = await PDFDocument.fromURL(
        widget.book.book,
      );
    } catch (error, stackTrace) {
      log(
        'PDF Can\'t be loaded',
        error: error,
        stackTrace: stackTrace,
        name: 'loadDocument',
      );
    }

    _isLoading = false;
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
          widget.book.name,
          style: GoogleFonts.khand(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              launch(widget.book.book);
            },
            icon: const Icon(
              CupertinoIcons.arrow_down_square_fill,
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PDFViewer(
              document: _document,
              scrollDirection: Axis.vertical,
              enableSwipeNavigation: true,
              lazyLoad: true,
              indicatorBackground: AppColors.red,
              pickerButtonColor: AppColors.red,
            ),
    );
  }
}
