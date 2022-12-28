import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = 'Dana Asfour';
    _phoneController.text = '+962779086452';
    _emailController.text = 'dana@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg'))),
                    ),
                    Positioned(
                      right: 1,
                      bottom: 0,
                      child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Name', style: TextStyle(fontSize: 17)),
              ),
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)))),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Phone Number', style: TextStyle(fontSize: 17)),
              ),
              TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)))),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Email address', style: TextStyle(fontSize: 17)),
              ),
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50))))
            ],
          ),
        ));
  }
}
