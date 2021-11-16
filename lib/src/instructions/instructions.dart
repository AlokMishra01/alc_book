import 'package:alc_book/src/categories/categories.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  void initState() {
    super.initState();
    _firstTime();
  }

  _firstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('firstTime', true);
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
                        'यो APP Android र Apple मोबाइल वा ट्यावमा डाउनलोड गर्न सकिन्छ । '
                        'यस App मा डा. तिमोथी अर्यालका १८ भन्दा बढी उच्च स्तरका पुस्तकहरू छन् '
                        'जसले एउटा विश्वासी र चर्चको आत्मिक जीवन शिखरमा पुग्न मद्दत गर्ने छन् । '
                        'यी पुस्तकहरूलाई धेरै वर्ष सम्म व्यक्तिगत डिभोसन, परिवारको सङ्गति, घरेलु '
                        'सङ्गति, चर्चको प्रचार सेवा, बाइबल कलेज र तालिमहरूमा प्रयोग गरेर अत्यधिक '
                        'आत्मिक फाइदा पाउन सक्नु हुनेछ (एफिसी ४ः१२) ।\n\n'
                        'कृपया एउटा–एउटा अथवा सबै पुस्तक प्रिन्ट गरी पुस्तकहरू बनाउनुहोस् । जसले '
                        'अध्ययन गर्न र अरूलाई सिकाउन सजिलो हुनेछ । कृपया पुस्तक लेखकका निम्ति '
                        'अन्तर्बिन्ती प्रार्थना गरिदिनुहुन अनुरोध गर्दछु ।\n\n'
                        'यस App मा भएका पुस्तकहरूको रोयल्टी रु १५०० हो (पवित्र आत्माको प्रेरणामा '
                        'चाहेजति थपेर उपहार दिन सक्नुहुने छ) । रोयल्टी तिरे पछि मात्रै तपाईंले '
                        'पुस्तकहरू प्रयोग गर्नुहोला तर छापेर बिक्री बितरण गर्न वा अरूलाई सफ्ट '
                        'पुस्तकहरू टान्सफर गर्न मनाही छ । कृपया, ख्रिस्टियन आचरण र मूल्य मान्यता '
                        'पालना गर्नु होला । रोयल्टीको रकम निम्न बैङ्कमा दाखिला गर्नुहोला अथवा अनलाइन '
                        'भुक्तानी गर्नु होला (सजिलोका निम्ति मन मिल्ने व्यक्तिहरू मिलेर समूहको एकमुस्ट '
                        'रकम पनि पठाउन सक्नु हुनेछ)। धन्यवाद',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
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
                            'Name:',
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
                            'Name:',
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
                            'Name:',
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
                      Divider(
                        color: AppColors.textTwo,
                        thickness: 1.0,
                        height: 36.0,
                      ),
                      Text(
                        'म येसु ख्रिस्टलाई प्रेम गर्ने एउटा समर्पित ख्रिस्टियन हँु । '
                        'यस App का नियमहरू पालना गर्ने छु । '
                        'रोअल्टि रकम ब्याङ्कमा भुक्तानी गरि सकेको छु । धन्यवाद',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      MaterialButton(
                        elevation: 0.0,
                        color: AppColors.red,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48.0),
                        ),
                        child: Text(
                          'Take me to\nthe Form',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                        ),
                        onPressed: () {
                          launch(
                            'https://docs.google.com/forms/d/e/'
                            '1FAIpQLScn7bLUrlfL_FyigzuFsU65C_'
                            'dM3vzlRKjPjkXjS7Mf-9HfiQ/viewform',
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
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
                          child: const Categories(),
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
