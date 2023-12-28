import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Books Timothy App मा प्रोफेसर एवम् डा तिमोथी अर्यालले तीस वर्ष भन्दा लामो अध्ययन'
                        ' र अनुसन्धानद्वारा तयार गर्नु भएका उच्च स्तरका थुप्रै पुस्तकहरु छन्।'
                        ' यी पुस्तकहरुले पठाकज्यूको जीवन उचाइमा पुग्न सहयोग गर्ने छन्।',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Download (Android): ',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Books Timothy',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            // decorationThickness: 2,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => launchUrl(
                                  Uri.parse(
                                      'https://play.google.com/store/apps/details?id=np.com.alokmishra.alc_book&pcampaignid=web_share'),
                                  mode: LaunchMode.externalApplication,
                                ),
                        ),
                      ])),
                      const SizedBox(height: 5),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Download (Desktop/ios): ',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'timothy-books.web.app',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            // decorationThickness: 2,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => launchUrl(
                                  Uri.parse('https://timothy-books.web.app/'),
                                  mode: LaunchMode.externalApplication,
                                ),
                        ),
                      ])),
                      // Text(
                      //   'Download (Android): Books Timothy',
                      //   // textAlign: TextAlign.justify,
                      //   style: TextStyle(
                      //     color: AppColors.primary,
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                      const SizedBox(height: 5),
                      Text(
                        'Download (Desktop/ios): timothy-books.web.app',
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'तपाईंले लेखकको दर्शन र मिसनमा सहयोग गर्न साँचो प्रेरणा पाउनुभयो भने '
                        'नियमित वा पटक-पटक वा अन्य कुनै प्रकारको सहयोग रकम पठाउन सक्नु हुनेछ।',
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
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(const ClipboardData(
                                  text: 'A/C name: Deesis Aryal\n'
                                      'Rastriya Banijya Bank\n'
                                      'Swift Code: RBBANPKA\n'
                                      'A/C No: 1150100043134010',
                                ));
                                SnackbarMessage.message(
                                    message: 'Details copied',
                                    context: context);
                              },
                              child: Text(
                                'A/C name: Deesis Aryal\n'
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
                          ),
                        ],
                      ),
                      // const SizedBox(height: 8.0),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       '➡',
                      //       textAlign: TextAlign.justify,
                      //       style: TextStyle(
                      //         color: AppColors.textTwo,
                      //         fontSize: 14.0,
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 8.0),
                      //     Expanded(
                      //       child: Text(
                      //         'Deesis Aryal\n'
                      //         'Nepal Investment Bank Ltd\n'
                      //         'Swift Code: NIBLNPKT\n'
                      //         'A/C No: 01705080076526',
                      //         textAlign: TextAlign.justify,
                      //         style: TextStyle(
                      //           color: AppColors.textTwo,
                      //           fontSize: 14.0,
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(const ClipboardData(
                                    text: 'A/C name: Tara Aryal\n'
                                        'Nepal SBI Bank Ltd, Kathmandu\n'
                                        'Swift Code: NSBINPKA\n'
                                        'A/C No: 21515243400328'));
                                SnackbarMessage.message(
                                    message: 'Details copied',
                                    context: context);
                              },
                              child: Text(
                                'Tara Aryal\n'
                                'Nepal SBI Bank Ltd, Kathmandu\n'
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
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(const ClipboardData(
                                  text: 'A/C name:Sushma Shrestha\n'
                                      'Esewa/Khalti: 9840841486',
                                ));
                                SnackbarMessage.message(
                                    message: 'Details copied',
                                    context: context);
                              },
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
                      // const SizedBox(height: 24.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {},
                      //       color: Colors.transparent,
                      //       iconSize: 28.0,
                      //       icon: const Icon(
                      //         CupertinoIcons.arrow_left,
                      //       ),
                      //     ),
                      //     MaterialButton(
                      //       elevation: 0.0,
                      //       color: AppColors.primary,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(48.0),
                      //       ),
                      //       child: Text(
                      //         'Next',
                      //         style: TextStyle(
                      //           color: AppColors.white,
                      //           fontWeight: FontWeight.w700,
                      //           fontSize: 14.0,
                      //         ),
                      //       ),
                      //       onPressed: () {
                      //         Navigator.pushAndRemoveUntil(
                      //           context,
                      //           PageTransition(
                      //             type: PageTransitionType.rightToLeft,
                      //             child: const OurBook(),
                      //           ),
                      //           (route) => false,
                      //         );
                      //       },
                      //     ),
                      //   ],
                      // ),
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
