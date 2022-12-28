import 'dart:convert';

import 'package:ecommerce_app/con_values.dart';
import 'package:ecommerce_app/views/forget_password.dart';
import 'package:ecommerce_app/views/home_page.dart';
import 'package:ecommerce_app/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String initialCountry = 'JO';
  PhoneNumber number = PhoneNumber(isoCode: 'JO');
  bool _isInvisible = true;
  var phone = "";

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'JO');
    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    final response = await http.post(Uri.parse("${ConsValue.URL}login.php"),
        body: {"Phone": phone, "Password": passwordController.text});
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      if (jsonBody["result"]) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(ConsValue.Id, jsonBody["Id"]);
        await prefs.setString(ConsValue.Email, jsonBody["Email"]);
        await prefs.setString(ConsValue.UserName, jsonBody["UserName"]);
        await prefs.setString(ConsValue.Phone, jsonBody["Phone"]);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(jsonBody['msg']),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Sign In',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 50),
                  Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                        phone = number.phoneNumber!;
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: phoneController,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                    child: TextField(
                      controller: passwordController,
                      obscureText: _isInvisible,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.purple),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _isInvisible = !_isInvisible;
                                setState(() {});
                              },
                              icon: _isInvisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPassword()));
                          },
                          child: const Text('Forget Password?'))),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: const Text('LOGIN'))),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text('Create'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
