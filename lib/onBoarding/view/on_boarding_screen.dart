import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../details/view/details_cart_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Background Image
          Positioned.fill(
            child: Image.network(
              'https://images.pexels.com/photos/30767567/pexels-photo-30767567.jpeg?_gl=1*910fjj*_ga*NjUyNDExMjIwLjE3NzgzODM3Mjk.*_ga_8JE65Q40S6*czE3NzgzODM3MjkkbzEkZzEkdDE3NzgzODM3NDMkajQ2JGwwJGgw',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10.h,
            left: 4.w,
            child: Container(
              width: 380.w,
              height: 380.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color.fromARGB(255, 166, 138, 55).withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 2. Gradient Overlay for readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.9),
                  ],
                  stops: const [0.0, 0.5, 0.9],
                ),
              ),
            ),
          ),

          // 3. Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Main Title
                  Text(
                    'Find the signature scent you love & fragrances 🧴',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Subtitle
                  Text(
                    'The leading online source for branded, world-class fragrances awaits your discovery.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // Page Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      CircleAvatar(radius: 2.r, backgroundColor: Colors.grey),
                      SizedBox(width: 8.w),
                      CircleAvatar(radius: 2.r, backgroundColor: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 40.h),

                  // Swipe To Start Button
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),

                          // glass layer
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.10),
                              Colors.white.withOpacity(0.04),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),

                          // 🧊 border glow
                          border: Border.all(
                            color: Colors.white.withOpacity(0.18),
                            width: 1,
                          ),

                          // depth
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              blurRadius: 25,
                              offset: const Offset(0, 12),
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(-2, -2),
                            ),
                          ],
                        ),

                        child: InkWell(
                          borderRadius: BorderRadius.circular(40.r),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailsCartScreen(),
                              ),
                            );
                          },

                          child: Row(
                            children: [
                              //  LEFT GLASS BUTTON
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.all(10),

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.black.withOpacity(0.01),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),

                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.18),
                                  ),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.08),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),

                                child: const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),
                              ),

                              //  TEXT
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Swipe To Start',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
