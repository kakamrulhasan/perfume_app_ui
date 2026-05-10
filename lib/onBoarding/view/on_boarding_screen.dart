import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            top: 10,
            left: 4,
            child: Container(
              width: 380,
              height: 380,
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                  const SizedBox(height: 16),

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
                  const SizedBox(height: 30),

                  // Page Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const CircleAvatar(
                        radius: 2,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      const CircleAvatar(
                        radius: 2,
                        backgroundColor: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Swipe To Start Button
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Test2()),
                        // );
                      },
                      child: Row(
                        children: [
                          // Circle Arrow
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2D2D2D),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                          // Text
                          Expanded(
                            child: Center(
                              child: Text(
                                'Swipe To Start',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          // Empty space to balance the arrow layout
                          const SizedBox(width: 50),
                        ],
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
