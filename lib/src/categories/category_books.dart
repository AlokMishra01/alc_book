import 'package:alc_book/src/book_pdf/book_pdf.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryBooks extends StatefulWidget {
  final String title;
  final List<BookModel> books;

  const CategoryBooks({
    Key? key,
    required this.title,
    this.books = const [],
  }) : super(key: key);

  @override
  State<CategoryBooks> createState() => _CategoryBooksState();
}

class _CategoryBooksState extends State<CategoryBooks> {
  late SharedPreferences _pref;
  // String _user = '';
  bool _loaded = false;

  bool status = true;
  bool load = false;

  @override
  void initState() {
    super.initState();
    // _checkStatus();
    // _getUser();
  }

  _checkStatus() async {
    final data = await FirebaseFirestore.instance
        .collection('iOSReview')
        .doc('inReview')
        .get();
    status = data.get('status') ?? false;
    load = true;
    setState(() {});
  }

  // _getUser() async {
  //   _pref = await SharedPreferences.getInstance();
  //   _user = _pref.getString('user') ?? '';
  //   _loaded = true;
  //   setState(() {});
  // }

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
                imageUrl: widget.books[i].cover,
                height: width / 2,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.books[i].name,
                      style: GoogleFonts.khand(
                        color: AppColors.textOne,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      widget.books[i].author,
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
                              title: widget.title,
                              book: widget.books[i],
                            ),
                          ),
                        );
                      },
                    ),
                    // if (status && load)
                    //   MaterialButton(
                    //     elevation: 0.0,
                    //     color: AppColors.red,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(24.0),
                    //     ),
                    //     child: Text(
                    //       'पढ्नुहोस्',
                    //       style: GoogleFonts.khand(
                    //         color: AppColors.white,
                    //         fontWeight: FontWeight.w400,
                    //         fontSize: 16.0,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         PageTransition(
                    //           type: PageTransitionType.rightToLeft,
                    //           child: BookPDF(
                    //             title: widget.title,
                    //             book: widget.books[i],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // if (!status && _loaded)
                    //   MaterialButton(
                    //     elevation: 0.0,
                    //     color: AppColors.red,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(24.0),
                    //     ),
                    //     child: Text(
                    //       'पढ्नुहोस्',
                    //       style: GoogleFonts.khand(
                    //         color: AppColors.white,
                    //         fontWeight: FontWeight.w400,
                    //         fontSize: 16.0,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         PageTransition(
                    //           type: PageTransitionType.rightToLeft,
                    //           child: BookPDF(
                    //             title: widget.title,
                    //             book: widget.books[i],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // // if (!status && _loaded)
                    // //   FutureBuilder<DocumentSnapshot>(
                    // //     future: FirebaseFirestore.instance
                    // //         .collection('users')
                    // //         .doc(_user)
                    // //         .get(),
                    // //     builder: (
                    // //       BuildContext context,
                    // //       AsyncSnapshot<DocumentSnapshot> snapshot,
                    // //     ) {
                    // //       if (snapshot.hasError) {
                    // //         return MaterialButton(
                    // //           elevation: 0.0,
                    // //           color: AppColors.red,
                    // //           shape: RoundedRectangleBorder(
                    // //             borderRadius: BorderRadius.circular(24.0),
                    // //           ),
                    // //           child: Text(
                    // //             'Pending',
                    // //             style: GoogleFonts.khand(
                    // //               color: AppColors.white,
                    // //               fontWeight: FontWeight.w400,
                    // //               fontSize: 16.0,
                    // //             ),
                    // //           ),
                    // //           onPressed: () {},
                    // //         );
                    // //       }
                    // //
                    // //       if (snapshot.hasData && !snapshot.data!.exists) {
                    // //         return MaterialButton(
                    // //           elevation: 0.0,
                    // //           color: AppColors.red,
                    // //           shape: RoundedRectangleBorder(
                    // //             borderRadius: BorderRadius.circular(24.0),
                    // //           ),
                    // //           child: Text(
                    // //             'Pending',
                    // //             style: GoogleFonts.khand(
                    // //               color: AppColors.white,
                    // //               fontWeight: FontWeight.w400,
                    // //               fontSize: 16.0,
                    // //             ),
                    // //           ),
                    // //           onPressed: () {},
                    // //         );
                    // //       }
                    // //
                    // //       if (snapshot.connectionState ==
                    // //           ConnectionState.done) {
                    // //         if ((snapshot.data?.get('status') ?? false)
                    // //             as bool) {
                    // //           return MaterialButton(
                    // //             elevation: 0.0,
                    // //             color: AppColors.red,
                    // //             shape: RoundedRectangleBorder(
                    // //               borderRadius: BorderRadius.circular(24.0),
                    // //             ),
                    // //             child: Text(
                    // //               'पढ्नुहोस्',
                    // //               style: GoogleFonts.khand(
                    // //                 color: AppColors.white,
                    // //                 fontWeight: FontWeight.w400,
                    // //                 fontSize: 16.0,
                    // //               ),
                    // //             ),
                    // //             onPressed: () {
                    // //               Navigator.push(
                    // //                 context,
                    // //                 PageTransition(
                    // //                   type: PageTransitionType.rightToLeft,
                    // //                   child: BookPDF(
                    // //                     title: widget.title,
                    // //                     book: widget.books[i],
                    // //                   ),
                    // //                 ),
                    // //               );
                    // //             },
                    // //           );
                    // //         } else {
                    // //           return MaterialButton(
                    // //             elevation: 0.0,
                    // //             color: AppColors.red,
                    // //             shape: RoundedRectangleBorder(
                    // //               borderRadius: BorderRadius.circular(24.0),
                    // //             ),
                    // //             child: Text(
                    // //               'Pending',
                    // //               style: GoogleFonts.khand(
                    // //                 color: AppColors.white,
                    // //                 fontWeight: FontWeight.w400,
                    // //                 fontSize: 16.0,
                    // //               ),
                    // //             ),
                    // //             onPressed: () {},
                    // //           );
                    // //         }
                    // //       }
                    // //
                    // //       return const SizedBox(
                    // //         height: 24.0,
                    // //         width: 24.0,
                    // //         child: CircularProgressIndicator(),
                    // //       );
                    // //     },
                    // //   ),
                  ],
                ),
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
