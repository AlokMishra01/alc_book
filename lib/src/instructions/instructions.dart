import 'dart:developer';

import 'package:alc_book/src/categories/categories.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                        'यो APP Android र Apple मोबाइल वा ट्यावमा डाउनलोड गर्न सकिन्छ । '
                        'यस APP मा डा. तिमोथी अर्यालका १८ भन्दा बढी उच्च स्तरका पुस्तकहरू छन् '
                        'जसले एउटा विश्वासी र चर्चको आत्मिक जीवन  शिखरमा पुग्न मद्दत गर्ने छन् । '
                        'यी पुस्तकहरूलाई धेरै वर्षसम्म व्यक्तिगत डिभोसन, परिवारको सङ्गति, घरेलु '
                        'सङ्गति, चर्चको प्रचार सेवा, बाइबल कलेज र तालिमहरूमा प्रयोग गरेर अत्यधिक '
                        'आत्मिक फाइदा पाउन सक्नुहुने छ (एफिसी 4:12) ।\n'
                        'कृपया एउटा एउटा अथवा सबै पुस्तक प्रिन्ट गरी पुस्तकहरू बनाउनुहोस्, जसले '
                        'अध्ययन गर्न र अरूलाई सिकाउन सजिलो हुने छ । कृपया पुस्तक लेखकका '
                        'निम्ति अन्तर्बिन्ती प्रार्थना  गरिदिनुहुन अनुरोध गर्दछु ।\n'
                        'यस App मा भएका पुस्तकहरूको रोयल्टी रु 1,500 हो (पवित्र आत्माको '
                        'प्रेरणामा चाहे जति थपेर उपहार दिन सक्नुहुने छ) । रोयल्टी तिरेपछि मात्रै तपाईंले '
                        'पुस्तकहरू प्रयोग गर्नुहोला तर छापेर बिक्री बितरण गर्न वा अरूलाई सफ्ट '
                        'पुस्तकहरू टान्सफर गर्न मनाही छ । कृपया, ख्रिस्टियन आचरण र मूल्य मान्यता '
                        'पालना गर्नुहोला । रोयल्टीको रकम निम्न बैङ्कमा दाखिला गर्नुहोला अथवा अनलाइन '
                        'भुक्तानी गर्नुहोला (सजिलोका निम्ति मन मिल्ने व्यक्तिहरू मिलेर समूहको एकमुस्ट '
                        'रकम पनि पठाउन सक्नुहुने छ तर डाउनलोड व्यक्तिगत गर्नु पर्दछ त्यसकारण सबै '
                        'जनाले एउटै बैङ्क भौचर नम्बर वा चेक नम्बर भर्नु पर्ने छ) । धन्यवाद!\n',
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
                        'म येसु ख्रिस्टलाई प्रेम गर्ने एउटा समर्पित विश्वासी भएकाले यस App का नियमहरू '
                        'पालना गर्ने छु । रोयल्टी रकम व्याङ्कमा भुक्तानी गरि सकेको छु । धन्यवाद!',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppColors.textTwo,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Personal Information (* required)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '*',
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: _fullName,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: const Text(
                                  'Full Name',
                                ),
                                labelStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.length < 2) {
                                  return 'Name Should Have At Least 3 Characters';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '*',
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: _mobile,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: const Text(
                                  'Phone Number',
                                ),
                                labelStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.length != 10) {
                                  return 'Phone Should Have At Least 10 Numbers';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '*',
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: const Text(
                                  'Email',
                                ),
                                labelStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                bool b = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                                ).hasMatch(value ?? '');
                                if (!b) {
                                  return 'Please enter valid email.';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            '*',
                            style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: _country,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: const Text(
                                  'Country',
                                ),
                                labelStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            '*',
                            style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _gender,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Male',
                                  child: Text(
                                    'Male',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Female',
                                  child: Text(
                                    'Female',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Others',
                                  child: Text(
                                    'Others',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                              isExpanded: true,
                              onChanged: (v) {
                                _gender = v;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: const Text(
                                  'Gender',
                                ),
                                hintText: 'Select Gender From List',
                                labelStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Bank Information ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.textTwo.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1.',
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
                                    'Deesis Aryal, '
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
                                  '2.',
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
                                    'Deesis Aryal, '
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
                                  '3.',
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
                                    'Tara Aryal, '
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Write below voucher number or account number through '
                        'that you paid the royalty.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: _voucher,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: const Text(
                                  'Voucher Number',
                                ),
                                labelStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if ((value ?? '').length < 3) {
                                  return 'Voucher Number Should Have At Least 4 Characters';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _account,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Deesis Aryal, Rastriya Banijya Bank',
                                  child: Text(
                                    'Deesis Aryal, Rastriya Banijya Bank',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Deesis Aryal, Nepal Investment Bank',
                                  child: Text(
                                    'Deesis Aryal, Nepal Investment Bank',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Tara Aryal, Nepal SBI Bank Ltd.',
                                  child: Text(
                                    'Tara Aryal, Nepal SBI Bank Ltd.',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                              isExpanded: true,
                              onChanged: (v) {
                                _account = v;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: const Text(
                                  'Account',
                                ),
                                hintText: 'Select Account From List',
                                labelStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      if (!_isSaved && !_saving)
                        MaterialButton(
                          elevation: 0.0,
                          color: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48.0),
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                          onPressed: _saveData,
                        ),
                      if (!_isSaved && _saving)
                        CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      if (!_isSaved) const SizedBox(height: 24.0),
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

  _saveData() async {
    if (_voucher.text.isEmpty) {
      return;
    }
    _saving = true;
    setState(() {});
    try {
      final f = FirebaseFirestore.instance;
      await f.collection('users').doc(_voucher.text).set({
        'fullName': _fullName.text,
        'phone': _mobile.text,
        'email': _email.text,
        'gender': _gender,
        'country': _country.text,
        'voucher': _voucher.text,
        'account': _account,
      });
      _isSaved = true;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setBool('skip', true);
      _saving = false;
      setState(() {});
    } catch (e, s) {
      log('Firebase Store Error!', error: e, stackTrace: s);
      _saving = false;
      setState(() {});
    }
  }
}
