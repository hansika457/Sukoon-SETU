import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sukoon_setu/screens/home_page.dart';
import 'package:sukoon_setu/screens/language_selection_page.dart';

class PhoneOtpLoginPage extends StatefulWidget {
  final Function(Locale) onLocaleSelected;
  const PhoneOtpLoginPage({super.key, required this.onLocaleSelected});

  @override
  State<PhoneOtpLoginPage> createState() => _PhoneOtpLoginPageState();
}

class _PhoneOtpLoginPageState extends State<PhoneOtpLoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  String _otpCode = '';
  bool _otpSent = false;

final FirebaseAuth _auth = FirebaseAuth.instance;
String _verificationId = '';

void _sendOtp() async {
  String phone = '+91${_phoneController.text.trim()}';

  await _auth.verifyPhoneNumber(
    phoneNumber: phone,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
      _checkUserAndNavigate();
    },
    verificationFailed: (FirebaseAuthException e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Verification failed: ${e.message}")),
      );
    },
    codeSent: (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
        _otpSent = true;
      });
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      _verificationId = verificationId;
    },
  );
}

void _verifyOtp() async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _otpCode,
    );

    await _auth.signInWithCredential(credential);
    _checkUserAndNavigate();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid OTP. Please try again.")),
    );
  }
}

void _checkUserAndNavigate() async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) return;

  final userDoc = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .get();

  if (userDoc.exists) {
    // User already registered, go to HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(onLocaleChange: widget.onLocaleSelected)),
    );
  } else {
    // New user, take details
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LanguageSelectionScreen(onLocaleChange: widget.onLocaleSelected),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Icon(
                Icons.lock_outline,
                size: 60,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                'Login with Phone',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Secure and simple login experience',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 40),

              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixText: '+91 ',
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              if (_otpSent) ...[
                Text(
                  'Enter the 6-digit OTP sent to your phone',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onBackground.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Pinput(
                  length: 6,
                  onChanged: (value) => _otpCode = value,
                  defaultPinTheme: PinTheme(
                    width: 48,
                    height: 56,
                    textStyle: theme.textTheme.titleLarge,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      border: Border.all(color: theme.colorScheme.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _otpSent ? _verifyOtp : _sendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _otpSent ? 'Verify OTP' : 'Send OTP',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const Spacer(),
              Text(
                'Need help? Contact Support',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
