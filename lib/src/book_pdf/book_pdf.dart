import 'dart:io';

import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
            widget.book.name,
            style: GoogleFonts.khand(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            if (!status || !Platform.isIOS)
              IconButton(
                onPressed: () {
                  launchUrl(Uri.parse(widget.book.book));
                },
                icon: const Icon(
                  CupertinoIcons.arrow_down_square_fill,
                ),
              ),
            // if (!status || !Platform.isIOS)
            //   PopupMenuButton(
            //     icon: const Icon(
            //       Icons.keyboard_arrow_down_rounded,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12.0),
            //     ),
            //     onSelected: (value) async {
            //       switch (value) {
            //         case 1:
            //           await FirebaseAuth.instance.signOut();
            //           final pref = await SharedPreferences.getInstance();
            //           await pref.setBool('logged', false);
            //           Navigator.pushAndRemoveUntil(
            //             context,
            //             PageTransition(
            //               type: PageTransitionType.rightToLeft,
            //               child: const Splash(),
            //             ),
            //             (route) => false,
            //           );
            //       }
            //     },
            //     itemBuilder: (cxt) => [
            //       PopupMenuItem<int>(
            //         value: 1,
            //         child: Text(
            //           'Log Out',
            //           style: TextStyle(
            //             color: AppColors.textTwo,
            //             fontSize: 14.0,
            //             fontWeight: FontWeight.w700,
            //             height: 1.0,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
          ],
        ),
        body: Scaffold(
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
              if (!status || !Platform.isIOS)
                IconButton(
                  onPressed: () {
                    launch(widget.book.book);
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_down_square_fill,
                  ),
                ),
              // if (!status || !Platform.isIOS)
              //   PopupMenuButton(
              //     icon: const Icon(
              //       Icons.keyboard_arrow_down_rounded,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //     ),
              //     onSelected: (value) async {
              //       switch (value) {
              //         case 1:
              //           await FirebaseAuth.instance.signOut();
              //           final pref = await SharedPreferences.getInstance();
              //           await pref.setBool('logged', false);
              //           Navigator.pushAndRemoveUntil(
              //             context,
              //             PageTransition(
              //               type: PageTransitionType.rightToLeft,
              //               child: const Splash(),
              //             ),
              //             (route) => false,
              //           );
              //       }
              //     },
              //     itemBuilder: (cxt) => [
              //       PopupMenuItem<int>(
              //         value: 1,
              //         child: Text(
              //           'Log Out',
              //           style: TextStyle(
              //             color: AppColors.textTwo,
              //             fontSize: 14.0,
              //             fontWeight: FontWeight.w700,
              //             height: 1.0,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
            ],
          ),
          body: const PDF(
            pageSnap: false,
            enableSwipe: true,
            pageFling: false,
          ).cachedFromUrl(
            widget.book.book,
            placeholder: (progress) => Center(
              child: CircularProgressIndicator(
                value: progress / 100,
              ),
            ),
            errorWidget: (error) => Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_rounded,
                        color: AppColors.red,
                        size: 64.0,
                      ),
                      Text(
                        error.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // body: _isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     : PDFViewer(
          //         document: _document,
          //         scrollDirection: Axis.vertical,
          //         enableSwipeNavigation: true,
          //         lazyLoad: true,
          //         indicatorBackground: AppColors.red,
          //         pickerButtonColor: AppColors.red,
          //       ),
        ));
  }
}

// to test this put it to the body of the scaffold
// SfPdfViewer.network(
// widget.book.book,
// onDocumentLoadFailed: (error) => Center(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Icon(
// Icons.error_rounded,
// color: AppColors.red,
// size: 64.0,
// ),
// Text(
// error.toString(),
// textAlign: TextAlign.center,
// style: TextStyle(
// color: AppColors.red,
// fontWeight: FontWeight.w600,
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// ),
