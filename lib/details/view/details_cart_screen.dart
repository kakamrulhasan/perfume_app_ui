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
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 1,
            child: Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.2), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.3), Colors.transparent],
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Top Section: Header and Product Image Area
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    // Background Glow
                    Positioned(
                      top: -100,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withOpacity(0.05),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Main Content
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Custom App Bar
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

                            // Title and Subtitle
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        color: Colors.grey[500],
                                        fontSize: 14,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                                // "NEW" Badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD32F2F),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'NEW',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Product Presentation Area (Bottle and Ring)
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // The Elliptical Ring
                                  Positioned(
                                    bottom: 40,
                                    child: Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateX(1.2),
                                      alignment: FractionalOffset.center,
                                      child: Container(
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
                                    ),
                                  ),
                                  // Sliding dot on the ring
                                  Positioned(
                                    bottom: 35,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white24,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Product Image
                                  Center(
                                    child: Image.network(
                                      'https://mir-s3-cdn-cf.behance.net/projects/404/46b6f4230117359.Y3JvcCwxMDgwLDg0NCwwLDI1MQ.jpg', // A representative body spray image
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  // Color Selector Tooltip
                                  Positioned(
                                    left: 30,
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

              // Bottom Section: Description and Cart
              Container(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Tabs and Counter
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _buildTab('Description', true),
                            const SizedBox(width: 20),
                            _buildTab('Reviews', false),
                          ],
                        ),
                        _buildCounter(),
                      ],
                    ),
                    const SizedBox(height: 25),

                    Text(
                      'Introducing the Axe Ice Chill Body Spray by the World\'s No.1 Male Deodorant brand - Axe. With a wide range of deodorants, no gas perfumes and male grooming products, Axe is your wingman for all your daily grooming needs.',
                      style: GoogleFonts.inter(
                        color: Colors.grey[600],
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Add to Cart Button
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(),
                          ),
                        );
                      },
                      child: _buildAddToCartButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildColorSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            'Color',
            style: GoogleFonts.inter(color: Colors.grey, fontSize: 10),
          ),
          const SizedBox(height: 10),
          _buildColorDot(Colors.grey[800]!, true),
          _buildColorDot(Colors.red[400]!, false),
          _buildColorDot(Colors.orange[200]!, false),
        ],
      ),
    );
  }

  Widget _buildColorDot(Color color, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? Colors.white54 : Colors.transparent,
        ),
      ),
      child: CircleAvatar(radius: 6, backgroundColor: color),
    );
  }

  Widget _buildTab(String label, bool active) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: active ? Colors.white : Colors.grey[600],
            fontWeight: active ? FontWeight.w600 : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        if (active)
          Container(
            margin: EdgeInsets.only(top: 4),
            height: 2,
            width: 30,
            color: Colors.white,
          ),
      ],
    );
  }

  Widget _buildCounter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.remove_circle_outline, color: Colors.grey[600], size: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '$quantity',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(Icons.add_circle_outline, color: Colors.grey[600], size: 20),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          // Left Circle Icon
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF2D2D2D),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),

          // Text
          Expanded(
            child: Center(
              child: Text(
                'Add To Cart',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          // Price
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
              '\$25.00',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
