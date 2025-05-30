import 'package:flutter/material.dart';
import 'package:smartapi/features/auth/data/models/User.dart';
import 'package:smartapi/features/auth/presentation/widgets/input_fields.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  User? user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 100.0,
            ),

            child: Column(
              children: [
                Text(
                  "Smart \n Organizer",
                  style: TextStyle(
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                    letterSpacing: 10,
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: _registerKey,
                  child: Column(
                    spacing: 20,
                    children: [
                      inputFields(
                        context: context,
                        hintText: "Enter your full name",
                        labelText: "Full Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your full name";
                          }
                          return null;
                        },
                        icon: Icons.person_outline,

                        TextInputType: TextInputType.name,
                        onSaved: (value) {
                          user!.fullName = value; // Save the full name value
                          // Save the full name value if needed
                        },
                      ),
                      SizedBox(height: 2),
                      inputFields(
                        context: context,
                        hintText: "Enter your email",
                        labelText: "Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        icon: Icons.email_outlined,

                        TextInputType: TextInputType.emailAddress,
                        onSaved: (value) {
                          user!.email = value; // Save the email value
                        },
                      ),
                      SizedBox(height: 2),
                      // Using the reusable inputFields widget for Password
                      inputFields(
                        context: context,
                        hintText: "Enter your password",
                        labelText: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        icon: Icons.lock_outline,
                        obscure: true,
                        controller: _passwordController,
                        TextInputType: TextInputType.visiblePassword,
                        onSaved: (value) {
                          user!.password = value; // Save the password value
                        },
                      ),
                      SizedBox(height: 2),

                      inputFields(
                        context: context,
                        hintText: "Confirm password",
                        labelText: " Confirm Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          } else if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        icon: Icons.lock_outline,
                        obscure: true,

                        TextInputType: TextInputType.visiblePassword,
                        onSaved: (value) {
                          // You can save the confirmed password if needed
                        },
                      ),
                      SizedBox(height: 2),

                      inputFields(
                        context: context,
                        hintText: "Enter your Address",
                        labelText: "Address",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your address";
                          }
                          return null;
                        },
                        icon: Icons.location_on_outlined,
                        TextInputType: TextInputType.visiblePassword,
                        onSaved: (value) {
                          user!.address = value; // Save the address value
                        },
                      ),
                      SizedBox(height: 2),

                      inputFields(
                        context: context,
                        hintText: "Enter your phone number",
                        labelText: "Phone Number",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your phone number";
                          } else if (!RegExp(
                            r'^\+?[0-9]{10,15}$',
                          ).hasMatch(value)) {
                            return "Please enter a valid phone number";
                          }
                          return null;
                        },
                        icon: Icons.phone_outlined,

                        TextInputType: TextInputType.visiblePassword,

                        onSaved: (value) {
                          user!.phoneNumber =
                              value; // Save the phone number value
                        },
                      ),
                      SizedBox(height: 2),

                      ElevatedButton(
                        onPressed: () {
                          if (_registerKey.currentState!.validate()) {
                            // Handle registration logic here
                            return;
                          }
                          _registerKey.currentState!.save();
                          // You can now use the user object with all the saved values
                          print(user!.toJson());
                        },
                        child: Text("Register"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50), //width and height
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              foregroundColor: Colors.deepPurple,
                            ),
                            child: Text("Login"),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                          ),
                        ],
                      ),
                    ],
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
