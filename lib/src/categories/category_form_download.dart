import 'package:alc_book/src/book_pdf/book_pdf.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class CategoryFormDownloads extends StatefulWidget {
  final String title;
  final List<BookModel> books;

  const CategoryFormDownloads({
    Key? key,
    required this.title,
    this.books = const [],
  }) : super(key: key);

  @override
  State<CategoryFormDownloads> createState() => _CategoryFormDownloadsState();
}

class _CategoryFormDownloadsState extends State<CategoryFormDownloads> {
  bool status = true;

  @override
  void initState() {
    super.initState();
    // _checkStatus();
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
          widget.title,
          style: GoogleFonts.khand(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
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
                widget.books[i].name,
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
                widget.books[i].author,
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
                        title: widget.title,
                        book: widget.books[i],
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
        itemCount: widget.books.length,
      ),
    );
  }
}
