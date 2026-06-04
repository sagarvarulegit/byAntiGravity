import 'package:flutter/material.dart';
import '../config.dart';
import '../services/auth_service.dart';
import '../theme.dart';

enum AuthTab { login, signUp, forgotPassword }

class AuthView extends StatefulWidget {
  final AuthService authService;
  final Function(AuthUser) onAuthSuccess;

  const AuthView({
    super.key,
    required this.authService,
    required this.onAuthSuccess,
  });

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with SingleTickerProviderStateMixin {
  AuthTab _activeTab = AuthTab.login;
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  // Form Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Animated Transitions
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _switchTab(AuthTab newTab) {
    if (_isLoading) return;
    setState(() {
      _activeTab = newTab;
      _errorMessage = null;
      _successMessage = null;
      _passwordController.clear();
      _formKey.currentState?.reset();
    });
    _animationController.reset();
    _animationController.forward();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      if (_activeTab == AuthTab.login) {
        final user = await widget.authService.signIn(
          _emailController.text,
          _passwordController.text,
        );
        widget.onAuthSuccess(user);
      } else if (_activeTab == AuthTab.signUp) {
        final user = await widget.authService.signUp(
          _emailController.text,
          _passwordController.text,
          _nameController.text,
        );
        _showToast("Account created successfully!", isError: false);
        widget.onAuthSuccess(user);
      } else if (_activeTab == AuthTab.forgotPassword) {
        await widget.authService.resetPassword(_emailController.text);
        setState(() {
          _successMessage = "Password reset link has been sent to your email!";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll("Exception: ", "");
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showToast(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: isError ? Colors.redAccent : Colors.greenAccent,
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: isError ? AppColors.purpleDark : AppColors.greenDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final double width = MediaQuery.of(context).size.width;
    final bool isWide = width > 600;

    return Scaffold(
      body: Stack(
        children: [
          // Background layout
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: isWide ? 460 : double.infinity,
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.cardDark : AppColors.cardLight,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                  border: Border.all(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // CBSE Header Branding
                        _buildBranding(isDark),
                        const SizedBox(height: 32),

                        // Form Title
                        Text(
                          _activeTab == AuthTab.login
                              ? "Sign In to Your Account"
                              : _activeTab == AuthTab.signUp
                                  ? "Create Your Student Profile"
                                  : "Reset Your Password",
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _activeTab == AuthTab.login
                              ? "Enter credentials to access CBSE Chapter animations & quizzes."
                              : _activeTab == AuthTab.signUp
                                  ? "Start studying now with our interactive vector notebooks."
                                  : "We will email you a link to securely reset your password.",
                          style: const TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 13,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),

                        // Info Banners
                        if (_errorMessage != null) _buildAlertBanner(_errorMessage!, isError: true),
                        if (_successMessage != null) _buildAlertBanner(_successMessage!, isError: false),

                        // Dynamic Fields
                        if (_activeTab == AuthTab.signUp) ...[
                          _buildLabel("FULL NAME"),
                          _buildTextField(
                            controller: _nameController,
                            hintText: "e.g. Rahul Kumar",
                            icon: Icons.person_outline,
                            validator: (val) => val == null || val.trim().isEmpty ? "Full name is required" : null,
                          ),
                          const SizedBox(height: 16),
                        ],

                        _buildLabel("EMAIL ADDRESS"),
                        _buildTextField(
                          controller: _emailController,
                          hintText: "e.g. student@cbseportal.com",
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) return "Email is required";
                            if (!val.contains('@')) return "Enter a valid email address";
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        if (_activeTab != AuthTab.forgotPassword) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildLabel("PASSWORD"),
                              if (_activeTab == AuthTab.login)
                                TextButton(
                                  onPressed: () => _switchTab(AuthTab.forgotPassword),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 12,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          _buildTextField(
                            controller: _passwordController,
                            hintText: "••••••••",
                            icon: Icons.lock_outline,
                            obscureText: true,
                            validator: (val) => val == null || val.length < 6 ? "Password must be at least 6 characters" : null,
                          ),
                          const SizedBox(height: 24),
                        ],

                        // Main Submit Button
                        _buildSubmitButton(),
                        const SizedBox(height: 20),

                        // Switch Links
                        _buildSwitchLinks(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : AppColors.cardLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? AppColors.borderDark : AppColors.borderLight,
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.purple),
                        strokeWidth: 3,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Connecting to CBSE Portal...",
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildBranding(bool isDark) {
    return Column(
      children: [
        // Simulated textbook cover beaker logo
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? Colors.white10 : AppColors.purpleLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.school_outlined,
            color: AppColors.purple,
            size: 40,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "CBSE Core Class 10",
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const Text(
          "National Curriculum Textbook System",
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 11,
            color: AppColors.blue,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 2.0),
      child: Text(
        labelText,
        style: const TextStyle(
          fontFamily: 'Outfit',
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 18, color: Colors.grey),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        filled: true,
        fillColor: isDark ? Colors.black12 : AppColors.bgLight,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.blue,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.purple,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.purple,
            width: 1.5,
          ),
        ),
      ),
    );
  }



  Widget _buildAlertBanner(String message, {required bool isError}) {
    final Color bgColor = isError ? AppColors.purpleLight : AppColors.greenLight;
    final Color textColor = isError ? AppColors.purpleDark : AppColors.greenDark;
    final Color borderColor = isError ? AppColors.purple : AppColors.green;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: Row(
        children: [
          Icon(isError ? Icons.error_outline : Icons.check_circle_outline, color: borderColor, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 12,
                color: textColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    String label = "Sign In";
    if (_activeTab == AuthTab.signUp) label = "Create Account";
    if (_activeTab == AuthTab.forgotPassword) label = "Send Reset Link";

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _submit,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: 48,
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchLinks() {
    if (_activeTab == AuthTab.login) {
      return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            "New student? ",
            style: TextStyle(fontFamily: 'Georgia', fontSize: 13, color: Colors.grey),
          ),
          GestureDetector(
            onTap: () => _switchTab(AuthTab.signUp),
            child: const Text(
              "Create an account",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 13,
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    } else if (_activeTab == AuthTab.signUp) {
      return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            "Already registered? ",
            style: TextStyle(fontFamily: 'Georgia', fontSize: 13, color: Colors.grey),
          ),
          GestureDetector(
            onTap: () => _switchTab(AuthTab.login),
            child: const Text(
              "Sign in here",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 13,
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    } else {
      // Forgot Password switch links
      return GestureDetector(
        onTap: () => _switchTab(AuthTab.login),
        child: const Text(
          "Back to Login Screen",
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 13,
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
