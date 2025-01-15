import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:smart_auth/smart_auth.dart';


class OTPInputScreen extends StatefulWidget {
  const OTPInputScreen({Key? key}) : super(key: key);

  @override
  _OTPInputScreenState createState() => _OTPInputScreenState();
}

class _OTPInputScreenState extends State<OTPInputScreen> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
    smsRetriever = SmsRetrieverImpl(SmartAuth());
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    const focusedBorderColor = Color(0xFF17AB90);
    const borderColor = Color(0xFFAAAAAA);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
            languageProvider.currentLocale.languageCode == 'en'
                                    ? " Enter OTP"
                                    : " أدخل كلمة المرور لمرة واحدة ",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
              ),
              
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                    languageProvider.currentLocale.languageCode == 'en'
                                    ? " Please enter the OTP sent to your phone"
                                    : "الرجاء إدخال رمز OTP المرسل إلى هاتفك",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  controller: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  validator: (value) {
                    return value == "123456" ? null : "Invalid OTP";
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint("Completed: $pin");
                  },
                  onChanged: (value) {
                    debugPrint("Changed: $value");
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint("OTP Verified");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:  Text(
                      languageProvider.currentLocale.languageCode == 'en'
                                    ? " Verify OTP"
                                    : " التحقق من كلمة المرور لمرة واحدة ",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Implementation of SmsRetriever
class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final res = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    return res.code;
  }

  @override
  bool get listenForMultipleSms => false;
}
