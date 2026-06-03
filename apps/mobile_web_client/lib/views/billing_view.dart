import 'package:flutter/material.dart';
import '../models.dart';
import '../theme.dart';

class BillingView extends StatefulWidget {
  final UserState userState;
  final VoidCallback onPaymentSuccessful;

  const BillingView({
    super.key,
    required this.userState,
    required this.onPaymentSuccessful,
  });

  @override
  State<BillingView> createState() => _BillingViewState();
}

class _BillingViewState extends State<BillingView> {
  bool _isProcessing = false;
  String _selectedMethod = "upi";
  final TextEditingController _upiController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();

  @override
  void dispose() {
    _upiController.dispose();
    _cardNumberController.dispose();
    super.dispose();
  }

  void _triggerPaymentSimulation() {
    showDialog(
      context: context,
      barrierDismissible: !_isProcessing,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              content: Container(
                width: 420,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Secure Gateway Checkout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          if (!_isProcessing)
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(Icons.close_rounded),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                        ],
                      ),
                    ),

                    // Payment summary
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      color: Colors.grey.withOpacity(0.05),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("CBSE Core Prep - 1 Year Pass", style: TextStyle(fontSize: 12)),
                          Text(
                            "₹2,999.00",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.purple),
                          ),
                        ],
                      ),
                    ),

                    if (_isProcessing) ...[
                      Container(
                        height: 180,
                        alignment: Alignment.center,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppColors.purple)),
                            SizedBox(height: 16),
                            Text("Securing checkout...", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("Verifying transaction with gateway...", style: TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      )
                    ] else ...[
                      // Payment tabs selector
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setDialogState(() => _selectedMethod = "upi");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: _selectedMethod == "upi" ? AppColors.purple : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone_iphone_rounded, color: _selectedMethod == "upi" ? AppColors.purple : Colors.grey, size: 16),
                                    const SizedBox(width: 8),
                                    const Text("UPI", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setDialogState(() => _selectedMethod = "card");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: _selectedMethod == "card" ? AppColors.purple : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.credit_card_rounded, color: _selectedMethod == "card" ? AppColors.purple : Colors.grey, size: 16),
                                    const SizedBox(width: 8),
                                    const Text("Card", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Input panels
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            if (_selectedMethod == "upi") ...[
                              TextField(
                                controller: _upiController,
                                decoration: InputDecoration(
                                  labelText: "Enter UPI ID (VPA)",
                                  hintText: "username@upi",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  helperText: "We support GPay, PhonePe, Paytm, and BHIM UPI.",
                                  helperStyle: const TextStyle(fontSize: 9),
                                ),
                              ),
                            ] else ...[
                              TextField(
                                controller: _cardNumberController,
                                decoration: InputDecoration(
                                  labelText: "Card Number",
                                  hintText: "4111 2222 3333 4444",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "Expiry Date",
                                        hintText: "MM/YY",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "CVV",
                                        hintText: "•••",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      obscureText: true,
                                    ),
                                  ),
                                ],
                              )
                            ],
                            const SizedBox(height: 20),
                            const Row(
                              children: [
                                Icon(Icons.lock_rounded, color: AppColors.green, size: 14),
                                SizedBox(width: 8),
                                Text("256-bit AES Encrypted. Razorpay Secure.", style: TextStyle(color: Colors.grey, fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Pay Submit Button
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setDialogState(() {
                              _isProcessing = true;
                            });
                            setState(() {
                              _isProcessing = true;
                            });

                            // Delay 2.5 seconds
                            Future.delayed(const Duration(milliseconds: 2500), () {
                              setState(() {
                                _isProcessing = false;
                              });
                              Navigator.of(context).pop();
                              widget.onPaymentSuccessful();
                              ScaffoldMessenger.of(this.context).showSnackBar(
                                const SnackBar(
                                  content: Text("Subscription Active! 1-Year CBSE Core Premium pass successfully activated."),
                                  backgroundColor: AppColors.green,
                                ),
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.purple,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text("Pay Securely ₹2,999", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPremium = widget.userState.isPremium;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                "CBSE Core Premium Access Plan",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 6),
              const Text(
                "Unlock unrestricted 1-Year access to animations, premium revision notes, solved CBSE sample papers, and interactive quizzes.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: 32),

              // Current Subscription Status Card
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Current Account Tier", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: isPremium ? AppColors.orangeLight : (isDark ? Colors.white10 : AppColors.borderLight),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isPremium ? "PREMIUM ACTIVE" : "FREE STARTER PLAN",
                              style: TextStyle(
                                color: isPremium ? AppColors.orange : Colors.grey,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isPremium
                            ? "Your account is fully upgraded. All math/science explanations, high-quality animations, solved question banks, and offline manifest downloads are unlocked."
                            : "You are currently browsing the free sections. Unlock chapters, full HD streaming, and unlimited quizzes with our yearly subscription.",
                        style: const TextStyle(color: Colors.grey, fontSize: 12.5, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),

              if (!isPremium) ...[
                const SizedBox(height: 32),
                // Pricing Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(36.0),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.orange, width: 2.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orange.withOpacity(0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "BEST VALUE",
                          style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "CBSE Board Prep - 1 Year Pass",
                        style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "₹2,999",
                            style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.w800,
                              color: isDark ? Colors.white : AppColors.textLightPrimary,
                              fontFamily: 'Outfit',
                              letterSpacing: -1,
                            ),
                          ),
                          const Text(
                            " / Year",
                            style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Less than ₹250/month. No recurring auto-renewals.",
                        style: TextStyle(color: AppColors.orange, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      
                      // Benefits list
                      _buildBenefitItem("Direct access to all 50+ Chapters (Maths, Science, Social)"),
                      _buildBenefitItem("Scalable Offline Manifest Download (No Internet Required)"),
                      _buildBenefitItem("100+ Chapter-wise Animated Explainer Videos"),
                      _buildBenefitItem("Premium Downloadable PDF Text Notes & Diagrams"),
                      _buildBenefitItem("Full Streak Multiplier (Boost your Leaderboard Rank)"),
                      
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: _triggerPaymentSimulation,
                        icon: const Icon(Icons.shield_outlined),
                        label: const Text("Secure Checkout - Pay ₹2,999", style: TextStyle(fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 54),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 16),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12.5, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}
