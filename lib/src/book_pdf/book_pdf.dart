import 'dart:io';

import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
  bool showOptionsBar = true;

  late PDFViewController _pdfViewController;
  final TextEditingController _pageNumberController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  int? totalPages;

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

  // void _handleDragUpdate(DragUpdateDetails details) {
  //   // Use details.delta.dy to determine the scroll direction and magnitude
  //   // Update UI or perform other actions as needed
  //   _scrollController.addListener(() {
  //     final scrollDirection = _scrollController.position.userScrollDirection;
  //     if (scrollDirection == ScrollDirection.forward) {
  //       print('Scrolling up');
  //       showOptionsBar = false;
  //       setState(() {});
  //     }
  //     if (scrollDirection == ScrollDirection.reverse) {
  //       print('Scrolling down');
  //       showOptionsBar = true;
  //       setState(() {});
  //     }
  //   });
  // }

  @override
  void dispose() {
    _pageNumberController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.red,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: AppColors.white,
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
              icon: Icon(
                CupertinoIcons.arrow_down_square_fill,
                color: AppColors.white,
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: PDF(
                  fitEachPage: false,
                  pageSnap: false,
                  pageFling: false,
                  // gestureRecognizers: Set()
                  //   ..add(
                  //     Factory<VerticalDragGestureRecognizer>(() =>
                  //         VerticalDragGestureRecognizer()
                  //           ..onUpdate = _handleDragUpdate),
                  //   ),
                  onViewCreated: (PDFViewController pdfViewController) {
                    _pdfViewController = pdfViewController;
                  },
                  onRender: (total) {
                    setState(() {
                      totalPages = total;
                    });
                  }).cachedFromUrl(
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
            ),
          ]),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: AnimatedContainer(
          //     // height: 40,
          //     height: showOptionsBar ? 50 : 0,
          //     width: 100.w,
          //     duration: Duration(milliseconds: 500),
          //     constraints: BoxConstraints(maxHeight: 70, maxWidth: 150),
          //     decoration: BoxDecoration(
          //       color: AppColors.background.withOpacity(0.8),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(5.0),
          //           child: SizedBox(
          //             width: width / 9,
          //             height: 40,
          //             child: TextFormField(
          //               // initialValue: '0',
          //               scrollPadding: EdgeInsets.zero,
          //               keyboardType: TextInputType.number,
          //               controller: _pageNumberController,
          //               style: TextStyle(fontSize: 12, color: Colors.black),
          //               onTapOutside: (pointerDownEvent) {
          //                 FocusScopeNode currentFocus = FocusScope.of(context);
          //                 if (!currentFocus.hasPrimaryFocus &&
          //                     currentFocus.focusedChild != null) {
          //                   currentFocus.focusedChild?.unfocus();
          //                 }
          //               },
          //               onFieldSubmitted: (_) {
          //                 int goToPage =
          //                     int.parse(_pageNumberController.text) - 1;
          //                 _pdfViewController.setPage(goToPage);
          //               },
          //               decoration: InputDecoration(
          //                 enabledBorder: OutlineInputBorder(
          //                   borderSide: BorderSide(color: AppColors.primary),
          //                   borderRadius: BorderRadius.circular(8),
          //                 ),
          //                 focusedBorder: OutlineInputBorder(
          //                   borderSide: BorderSide(color: AppColors.primary),
          //                   borderRadius: BorderRadius.circular(8),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Text('of ${totalPages == null ? '' : '$totalPages'}'),
          //         SizedBox(width: 5)
          //       ],
          //     ),
          //   ),
          // ),
        ],
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
    );
  }
}
