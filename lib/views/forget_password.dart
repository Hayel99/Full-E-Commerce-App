import 'package:ecommerce_app/views/otp_screen.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/1.png',
                height: 200,
              ),
              const Text('OTP Verification',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text(
                  'Please enter your phone number to send you a verification code',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              const SizedBox(height: 50),
              Material(
                elevation: 6.0,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(50),
                child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefixIcon:
                            const Icon(Icons.phone, color: Colors.purple),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)))),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtpScreen()));
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                      child: const Text('Send OTP code'))),
            ],
          ),
        ),
      ),
    );
  }
}
