import 'dart:async';
import 'package:craftybaynew/app/app_colors.dart';
import 'package:craftybaynew/app/app_constants.dart';
import 'package:craftybaynew/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:craftybaynew/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Timer timer;

  final RxInt  _remainingTime = AppConstants.resendOtpTimeOutSecs.obs;
 final  RxBool _enableRecendCodeButton= false.obs;

  @override
  void initState() {
    super.initState();
    _startRecentCodeTimer();
  }

  void _startRecentCodeTimer() {
    _enableRecendCodeButton.value= false;
    _remainingTime.value = AppConstants.resendOtpTimeOutSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
       // _remainingTime.value = 10;
      _remainingTime.value--;
      if(_remainingTime.value==0){
        t.cancel();
        _enableRecendCodeButton.value= true;
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const AppLogoWidget(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Inter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('A 4 Digit OPT has been sent to your mail',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  length: 6,
                  // obscureText: false,
                  //  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedFillColor: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                    // fieldHeight: 50,
                    // fieldWidth: 40,
                    activeFillColor: AppColors.themeColor,
                    inactiveColor: AppColors.themeColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  //  backgroundColor: Colors.blue.shade50,
                  //enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  controller: _otpTEController,
                  appContext: context,
                ),

                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    //  if(_formKey.currentState!.validate()){}
                    Navigator.pushNamed(context, CompleteProfileScreen.name);
                  },
                  child: const Text('Next'),
                ),
                // const Text('This code code will Expaired in 120s'),
                const SizedBox(
                  height: 12,
                ),
                // TODO Enable button when 120s is done
                Obx(
                  () => Visibility(
                    visible: !_enableRecendCodeButton.value,
                    child: RichText(
                      text:  TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        text: 'This code code will Expaired in ',
                        children: [
                          TextSpan(
                              text: '${_remainingTime}s',
                              style: const TextStyle(color: AppColors.themeColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx( () =>
                    Visibility(
                      visible: _enableRecendCodeButton.value,
                      child: TextButton(
                                        onPressed: () {
                      _startRecentCodeTimer();
                                        },
                                        child: const Text(
                      'Resend Code',
                                        ),
                                      ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
