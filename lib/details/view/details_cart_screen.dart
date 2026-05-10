import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../catagory/view/categories_screen.dart';

class DetailsCartScreen extends StatefulWidget {
  const DetailsCartScreen({super.key});

  @override
  State<DetailsCartScreen> createState() => _DetailsCartScreenState();
}

class _DetailsCartScreenState extends State<DetailsCartScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),

      body: Stack(
        children: [
          //  Glow background
          Positioned(
            top: 10,
            left: 20,
            child: Container(
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.18), Colors.transparent],
                ),
              ),
            ),
          ),

          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.purple.withOpacity(0.15), Colors.transparent],
                ),
              ),
            ),
          ),

          Column(
            children: [
              // TOP SECTION
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // HEADER
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: _buildCircularIcon(
                                    Icons.arrow_back_ios_new,
                                  ),
                                ),
                                _buildCircularIcon(Icons.favorite_border),
                              ],
                            ),

                            const SizedBox(height: 30),

                            // TITLE
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Axe pulse',
                                      style: GoogleFonts.playfairDisplay(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Axe Ice Chill Body Spray by the\nWorld\'s No.1 Male',
                                      style: GoogleFonts.inter(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),

                                    // iOS glass gradient
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.25),
                                        Colors.white.withOpacity(0.05),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),

                                    // border glow
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.25),
                                      width: 1,
                                    ),

                                    // soft glow shadow
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.08),
                                        blurRadius: 12,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'NEW',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // IMAGE AREA
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Ring glow
                                  Container(
                                    width: 250,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white24,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),

                                  // Product image
                                  Image.network(
                                    'https://mir-s3-cdn-cf.behance.net/projects/404/46b6f4230117359.Y3JvcCwxMDgwLDg0NCwwLDI1MQ.jpg',
                                    fit: BoxFit.cover,
                                  ),

                                  // Color selector
                                  Positioned(
                                    left: 10,
                                    top: 40,
                                    child: _buildColorSelector(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // BOTTOM SECTION (GLASS SHEET)
              // BOTTOM SECTION (GLASS SHEET WITH GRADIENT + BLUR)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
                    decoration: BoxDecoration(
                      // 🔥 glass gradient (top to bottom fade)
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.12), // stronger at top
                          Colors.white.withOpacity(0.06),
                          Colors.black.withOpacity(0.25), // darker bottom
                        ],
                      ),

                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),

                      border: Border.all(color: Colors.white.withOpacity(0.15)),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 25,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // drag handle
                        Center(
                          child: Container(
                            width: 50,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.5),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                _buildTab("Description", true),
                                const SizedBox(width: 20),
                                _buildTab("Reviews", false),
                              ],
                            ),
                            _buildCounter(),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Text(
                          'Introducing the Axe Ice Chill Body Spray by Axe. A premium grooming experience for modern lifestyle.',
                          style: GoogleFonts.inter(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 30),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoriesScreen(),
                              ),
                            );
                          },
                          child: _buildAddToCartButton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // HEADER ICON (iOS GLASS)
  Widget _buildCircularIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.20),
            Colors.white.withOpacity(0.05),
          ],
        ),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildColorSelector() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          _buildColorDot(Colors.grey, true),
          _buildColorDot(Colors.redAccent, false),
          _buildColorDot(Colors.orangeAccent, false),
        ],
      ),
    );
  }

  Widget _buildColorDot(Color color, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: selected ? Colors.white : Colors.transparent),
      ),
      child: CircleAvatar(radius: 6, backgroundColor: color),
    );
  }

  Widget _buildTab(String label, bool active) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.white54,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (active)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 30,
            color: Colors.white,
          ),
      ],
    );
  }

  Widget _buildCounter() {
    return Row(
      children: [
        const Icon(Icons.remove_circle_outline, color: Colors.white38),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("$quantity", style: const TextStyle(color: Colors.white)),
        ),
        const Icon(Icons.add_circle_outline, color: Colors.white38),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.25),
                  Colors.white.withOpacity(0.05),
                ],
              ),
            ),
            child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Add To Cart',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              '₹25.00',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
