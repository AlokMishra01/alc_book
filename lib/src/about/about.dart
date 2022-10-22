import 'dart:io';

import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
    final size = MediaQuery.of(context).size;
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
          'About Dr. Timothy',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          if (!status || !Platform.isIOS)
            IconButton(
              onPressed: () {
                launch(
                  'https://firebasestorage.googleapis.com/v0/b/timothy-books.'
                  'appspot.com/o/books%2FLeadership%20%26%20Counseling%20'
                  'College%2FProfessional%20Background%20of%20Timothy%20'
                  'Aryal.pdf?alt=media',
                );
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Professional Background of',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'TIMOTHY ARYAL (CV)',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(10.0),
                //   child: Image.network(Images.profile),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CachedNetworkImage(
                  placeholder: (_, __) => Container(
                    width: size.width - 48,
                    height: size.height - 240,
                    color: AppColors.textTwo.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  imageUrl: Images.about,
                ),
              ),
              // Expanded(
              //   child: Container(
              //     width: double.infinity,
              //     height: double.infinity,
              //     margin: const EdgeInsets.symmetric(horizontal: 32.0),
              //     padding: const EdgeInsets.all(16.0),
              //     decoration: BoxDecoration(
              //       color: AppColors.backgroundAlt,
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: SingleChildScrollView(
              //       physics: const BouncingScrollPhysics(),
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           _buildAboutItem(
              //             title: 'Family Background',
              //             details: 'Wife: Emma Aryal (M. A. & M. Div), '
              //                 'Son: Deesis Aryal and Daughter: Phoebe Aryal.',
              //           ),
              //           _buildAboutItem(
              //             title: ' Education',
              //             details: ' M. A. in Clinical Psychology, Leadership, '
              //                 'and Theology; Ph.D. in Counseling Psychology from '
              //                 'the University of Mysore, South India.',
              //           ),
              //           _buildAboutItem(
              //             title: 'Publications',
              //             details: 'Published book from USA (1); Course Book '
              //                 'M. A. Psychology (1); Course book M. Ed (1); '
              //                 'Best-selling psychological books e.g. Effective '
              //                 'Study Habits; Overcoming Psychological Problems; '
              //                 'Overcoming Anger and Anxiety, '
              //                 'Becoming Better Husband and Wife, etc.; '
              //                 'And best-selling Biblical books e.g. '
              //                 'Biblical Counseling; Intercession Prayer; '
              //                 'How to give God; Church and there our role; etc.',
              //           ),
              //           _buildAboutItem(
              //             title: 'Working experiences',
              //             details: 'Teaching in High School (10 years); '
              //                 'T.C. Campus (Over 20 yrs.); Former Head '
              //                 'Department of Psychology and Philosophy, '
              //                 'Former Co-coordinator: Post Graduate Diploma in '
              //                 'Counseling Psychology; Co-coordinator: M.A. '
              //                 'Psychology, T. C. Campus, Kathmandu (Current).',
              //           ),
              //           _buildAboutItem(
              //             title: 'Religion',
              //             details: 'Christian (Abundant Life Church, '
              //                 'Kuleshwor, Kathmandu).',
              //           ),
              //           _buildAboutItem(
              //             title: 'Interest and Hobby',
              //             details: 'Besides regular teaching psychology, '
              //                 'I am actively involved in leadership training '
              //                 'and counseling (Inner healing). I had suffered '
              //                 'for many years from psychological problems, but '
              //                 'Jesus healed me completely. Therefore, I have '
              //                 'deep compassion for suffering people. Also, my '
              //                 'hobbies are the book reading, traveling, '
              //                 'and writing.',
              //           ),
              //           _buildAboutItem(
              //             title: 'Why and How I became Christian?',
              //             details:
              //                 'One day suddenly my head turned back over two '
              //                 'times, and I became almost eighty percent blind. '
              //                 'I had a deep concern how I could survive the '
              //                 'rest of my life. I pondered, and various '
              //                 'thoughts came to my mind. I thought that I '
              //                 'wanted to live a healthy life otherwise it is '
              //                 'better me to die. Who will take care of me? '
              //                 'Tears were over flooding from my eyes, suddenly '
              //                 'saying of Jesus came in my mind, “Whoever comes '
              //                 'to me I will never drive away.” (Jn 6:37b). This '
              //                 'verse convicted me to believe Jesus. Going to '
              //                 'Jesus is a personal decision. We have to overcome '
              //                 'barriers and hindrances, and then only we can '
              //                 'reach to Him. He is such a close friend (God) who '
              //                 'never forsakes us. We all need such personal God. '
              //                 'As I understood this passage, I opened my heart '
              //                 'to accept Jesus as my personal savior. As I '
              //                 'accepted Christ and believed Him after this '
              //                 'pastor, prayed for me, and I received my healing '
              //                 'for such fatal neurological problem.\n\n'
              //                 'Even before this event, I had many psychological '
              //                 'problems. Because of psychological problems my '
              //                 'bones and skin had dried up, I passed many years '
              //                 'of my days and nights in tears; my life had '
              //                 'become gloomy and full of misery. My future was '
              //                 'dark. My house was like hells for me; tears were '
              //                 'my food. Discouragement and hopelessness were my '
              //                 'friends. I cried from the pit, and Jesus heard '
              //                 'my cry. God healed my emotions, feelings, guilt '
              //                 'and the past completely. He wiped out my tears '
              //                 'and sorrows.\n\n'
              //                 'On October 29, 2010, while my wife and I were '
              //                 'driving towards airport we were involved in a '
              //                 'dangerous accident. I vividly saw Satan seated '
              //                 'in the driver’s seat of the vehicle that struck '
              //                 'us. I was immediately taken to hospital by some '
              //                 'strangers. All the while I prayed to God in '
              //                 'tongues for about 6 hours until the doctors '
              //                 'made me unconscious for the operation. I '
              //                 'worshiped and thanked God and resisted the '
              //                 'enemy. My wife had only minor injuries, so she '
              //                 'returned home the same night.\n\n'
              //                 'Jesus gave me the assurance that He had heard '
              //                 'my prayer regarding my healing and rest of my '
              //                 'life. Nobody who saw the events or heard the '
              //                 'news through the media could believe that I '
              //                 'was alive and perfectly healthy. I am alive and '
              //                 'strong to witness the love and power of Jesus as '
              //                 'long as He keeps me on this earth (Is 53:5).3',
              //           ),
              //           _buildAboutItem(
              //             title: 'Request to the readers',
              //             details: 'Are you suffering? Do you have incurable '
              //                 'diseases, physical or psychological problems '
              //                 'beyond human solution? Or any other problems? '
              //                 'Please, come close to Jesus, He will bless you '
              //                 'and help you to overcome such problems. Send us '
              //                 'your prayer points, we will pray and Jesus will '
              //                 'heal you.',
              //             isItalic: true,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 24.0,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
