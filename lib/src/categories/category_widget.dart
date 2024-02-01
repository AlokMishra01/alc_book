import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.title,
    required this.onPressed,
    this.subtitle = '',
    this.color = const Color(0xFF126196),
    super.key,
  });

  final Color color;
  final String title;
  final String subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          height: 72.h,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: color,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 12.h, bottom: 12.0.h, left: 12.w, right: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.raleway(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(subtitle,
                      style: GoogleFonts.raleway(
                          fontSize: 12, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
