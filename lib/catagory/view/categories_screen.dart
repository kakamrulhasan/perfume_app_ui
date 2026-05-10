import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),

      body: Stack(
        children: [
          // Top Left Glow
          Positioned(
            top: 10,
            left: 30,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.2), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.1), Colors.transparent],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // --- Header ---
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: _buildHeaderIcon(Icons.arrow_back_ios_new),
                      ),

                      Text(
                        'Shopping Bag',
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      _buildHeaderIcon(Icons.shopping_bag_outlined),
                    ],
                  ),
                ),

                // --- Cart Items List ---
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    children: [
                      _buildCartItem(
                        "Ice Drive",
                        "Ice Drive",
                        "185.00",
                        "https://images.pexels.com/photos/29805437/pexels-photo-29805437.jpeg",
                      ),

                      _buildCartItem(
                        "Team Force",
                        "Adidas champion League...",
                        "399.00",
                        "https://t3.ftcdn.net/jpg/13/76/48/16/360_F_1376481664_dlZnlhLEDJ1MEdLODdc03L6wLaB7A9BQ.jpg",
                      ),

                      _buildCartItem(
                        "Victory Edition",
                        "Deo Body Spray",
                        "200.00",
                        "https://img.magnific.com/free-photo/dark-glass-bottle-with-single-liquid-drop-generative-ai_188544-9634.jpg",
                      ),

                      const SizedBox(height: 10),

                      // --- Promo Code Section ---
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F1F1F),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.08),
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),

                            const Expanded(
                              child: Text(
                                "Promo Code",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2D2D2D),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                "Apply",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // --- Price Summary ---
                      _buildSummaryRow("Subtotal (3 items)", "₹784"),

                      const SizedBox(height: 15),

                      _buildSummaryRow("Delivery charge", "Free"),

                      const SizedBox(height: 15),

                      const Divider(color: Colors.white10),

                      const SizedBox(height: 15),

                      _buildSummaryRow("Total", "₹784", isTotal: true),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                // --- Checkout Button ---
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: _buildCheckoutButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.08),
        border: Border.all(color: Colors.white10),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildCartItem(
    String title,
    String subtitle,
    String price,
    String imgUrl,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Stack(
        children: [
          Row(
            children: [
              // Product Image
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    imgUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              // Item Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "₹$price",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // Quantity Selector
              Row(
                children: [
                  const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white38,
                    size: 24,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "1kg",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),

                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.white38,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),

          // Close Button
          const Positioned(
            right: 0,
            top: 0,
            child: Icon(Icons.close, color: Colors.white24, size: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.white : Colors.white38,
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),

        Text(
          value,
          style: TextStyle(
            color: isTotal ? const Color(0xFF4CAF50) : Colors.white,
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
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
            child: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
          ),

          // Text
          Expanded(
            child: Center(
              child: Text(
                'Proceed To Checkout',
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
              '₹784',
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
