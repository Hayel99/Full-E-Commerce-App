import 'package:ecommerce_app/views/home_page.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/2.png',
              height: 200,
            ),
            const Text('Enter OTP Verification Code',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text(
                'Please enter your phone number to send you a verification code',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                          ),
                        ));
                  }),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ))),
                    child: const Text('Send'))),
          ],
        ),
      ),
    );
  }
}
