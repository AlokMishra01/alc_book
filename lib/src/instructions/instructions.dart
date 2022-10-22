import 'package:alc_book/src/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../our_books/our_book.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  final _fullName = TextEditingController();
  final _mobile = TextEditingController();
  final _email = TextEditingController();
  final _country = TextEditingController();
  final _voucher = TextEditingController();
  String? _gender;
  String? _account;

  bool _isSaved = false;
  bool _saving = false;

  @override
  void dispose() {
    _fullName.dispose();
    _mobile.dispose();
    _email.dispose();
    _country.dispose();
    _voucher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36.0,
                vertical: 24.0,
              ),
              child: MaterialButton(
                elevation: 0.0,
                color: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minWidth: double.infinity,
                child: Text(
                  'महत्त्वपूर्ण जानकारी (Instructions)',
                  style: GoogleFonts.khand(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        // 'यो APP Android र Apple मोबाइल वा ट्यावमा डाउनलोड गर्न सकिन्छ । '
                        // 'यस APP मा डा. तिमोथी अर्यालका १८ भन्दा बढी उच्च स्तरका पुस्तकहरू छन् '
                        // 'जसले एउटा विश्वासी र चर्चको आत्मिक जीवन शिखरमा पुग्न मद्दत गर्ने छन्। यी '
                        // 'पुस्तकहरूलाई धेरै वर्षसम्म व्यक्तिगत डिभोसन, परिवारको सङ्गति, घरेलु सङ्गति, '
                        // 'चर्चको प्रचार सेवा, बाइबल कलेज र तालिमहरूमा प्रयोग गरेर अत्यधिक आत्मिक '
                        // 'फाइदा पाउन सक्नुहुने छ (एफिसी ४ः१२)। कृपया पुस्तक लेखकका निम्ति '
                        // 'अन्तर्बिन्ती प्रार्थना गरिदिनुहुनअनुरोध गर्दछु । यस App मा भएका पुस्तकहरूको '
                        // 'रोयल्टी रु १,५०० हो (पवित्र आत्माको प्रेरणामा चाहे जति थपेर उपहार दिन '
                        // 'सक्नुहुने छ)। रोयल्टी तिरेपछि मात्रै तपाईंले पुस्तकहरू प्रयोग गर्नुहोला। कृपया, '
                        // 'ख्रिस्टियन आचरण र मूल्य मान्यता पालना गर्नुहोला। रोयल्टीको रकम निम्न बैंकमा '
                        // 'दाखिला गर्नुहोला अथवा अनलाइन भुक्तानी गर्नुहोला।धन्यवाद !',
                        'यस App मा डा. तिमोथी अर्यालका २१ भन्दा बढी उच्च स्तरका पुस्तकहरू छन्। '
                        'यस App का पुस्तकहरू Timothy-Books.web.app '
                        '(Laptop & Desktop) मा पनि उपलब्ध छन्। यस App को मूल्य रू १५०० '
                        'हो तर लेखकका तर्फबाट ९० प्रतिशत छूटको व्यवस्था गरिएको छ । पुस्तकहरू '
                        'अध्ययन गर्नुहोस् एवम् तपाईंले पठाउनुहुने मिसन मूल्य रू १५० ले '
                        'आश्चर्यकर्महरू सम्पादन गर्ने छ । प्रार्थनाका निम्ति अनुरोध छ ।',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                        color: AppColors.textTwo,
                        thickness: 1.0,
                        height: 36.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '➡',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: AppColors.textTwo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'Deesis Aryal\n'
                              'Rastriya Banijya Bank\n'
                              'Swift Code: RBBANPKA\n'
                              'A/C No: 1150100043134010',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: AppColors.textTwo,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '➡',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: AppColors.textTwo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'Deesis Aryal\n'
                              'Nepal Investment Bank Ltd\n'
                              'Swift Code: NIBLNPKT\n'
                              'A/C No: 01705080076526',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: AppColors.textTwo,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '➡',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: AppColors.textTwo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'Tara Aryal\n'
                              'Nepal SBI Bank Ltd, kath\n'
                              'Swift Code: NSBINPKA\n'
                              'A/C No: 21515243400328',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: AppColors.textTwo,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '➡',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: AppColors.textTwo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'Esewa or Khalti\n9840841486\n(Sushma Shrestha)',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: AppColors.textTwo,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.textTwo,
                        thickness: 1.0,
                        height: 36.0,
                      ),
                      // Text(
                      //   'म येसु ख्रिस्टलाई प्रेम गर्ने एउटा समर्पित विश्वासी भएकाले यस App का नियमहरू '
                      //   'पालना गर्ने छु । रोयल्टी रकम बैंकमा भुक्तानी गरि सकेको छु । धन्यवाद!',
                      //   textAlign: TextAlign.justify,
                      //   style: TextStyle(
                      //     color: AppColors.textTwo,
                      //     fontSize: 14.0,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                      const SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            color: Colors.transparent,
                            iconSize: 28.0,
                            icon: const Icon(
                              CupertinoIcons.arrow_left,
                            ),
                          ),
                          MaterialButton(
                            elevation: 0.0,
                            color: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48.0),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const OurBook(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: MaterialButton(
                      //         elevation: 0.0,
                      //         color: AppColors.primary,
                      //         padding: const EdgeInsets.symmetric(
                      //           vertical: 12.0,
                      //           horizontal: 24.0,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(24.0),
                      //         ),
                      //         child: Text(
                      //           'Register',
                      //           style: TextStyle(
                      //             color: AppColors.white,
                      //             fontWeight: FontWeight.w700,
                      //             fontSize: 18.0,
                      //           ),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.push(
                      //             context,
                      //             PageTransition(
                      //               type: PageTransitionType.rightToLeft,
                      //               child: const FirebaseRegisterView(),
                      //             ),
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //     Align(
                      //       alignment: Alignment.centerRight,
                      //       child: MaterialButton(
                      //         elevation: 0.0,
                      //         color: AppColors.primary,
                      //         padding: const EdgeInsets.symmetric(
                      //           vertical: 12.0,
                      //           horizontal: 24.0,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(24.0),
                      //         ),
                      //         child: Text(
                      //           'Login',
                      //           style: TextStyle(
                      //             color: AppColors.white,
                      //             fontWeight: FontWeight.w700,
                      //             fontSize: 18.0,
                      //           ),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.push(
                      //             context,
                      //             PageTransition(
                      //               type: PageTransitionType.rightToLeft,
                      //               child: const FirebaseAuthView(),
                      //             ),
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 36.0),
                    ],
                  ),
                ),
              ),
            ),
            if (_isSaved)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36.0,
                  vertical: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      // onPressed: () => Navigator.pop(context),
                      onPressed: () {},
                      // color: AppColors.primary,
                      color: Colors.transparent,
                      iconSize: 28.0,
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                      ),
                    ),
                    MaterialButton(
                      elevation: 0.0,
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const OurBook(),
                          ),
                          (route) => false,
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
