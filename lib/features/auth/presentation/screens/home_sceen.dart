import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartapi/constants/key_constants.dart';
import 'package:smartapi/features/auth/data/models/User.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user = User();
  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(KeyConstants.kKeyForUserDetail)) {
      User userDetail = User.fromJson(
        prefs.getString(KeyConstants.kKeyForUserDetail)!,
      );
      setState(() {
        user = userDetail;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello, ${user.name}', style: TextStyle(fontSize: 26)),
      ),
    );
  }
}
