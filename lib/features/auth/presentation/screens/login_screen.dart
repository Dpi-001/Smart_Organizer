import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // This widget is the root of your application.

  TextFormField inputFields({
    required BuildContext context,
    required String hintText,
    required String labelText,
    required IconData icon,
    bool obscure = false,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        prefixIcon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onSaved: (newValue) {},
      validator: (value) {
        return null;
      },
      keyboardType: textInputType,
      obscureText: obscure,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Smart \n  Organizer",
                style: TextStyle(
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 10,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefix: Icon(Icons.email_outlined, color: Colors.grey),
                        labelText: "Email",
                        hintText: "Enter your email",
                      ),
                      onTap: () => FocusScope.of(context).unfocus(),
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
