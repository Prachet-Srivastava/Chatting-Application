import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../components/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    // Get The Auth Service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Hero(
                      tag: 'text',
                      child: Text(
                        "ChitChat",
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            fontSize: 40,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),


                    // Image
                    Image(image: AssetImage('assets/images/pic1.jpg')),



                    // Welcome Back Text Message
                    const Text(
                      "Welcome Back! You've Been Missed!",
                      style: TextStyle(
                        color: Colors.blueGrey,fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Email Text Field
                    MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false),

                    const SizedBox(height: 10),

                    // Password Text Field
                    MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true),

                    const SizedBox(height: 12),

                    // Sign In Button
                    Hero(tag: 'button',
                        child: MyButton(onTap: signIn, text: "Sign In")),

                    const SizedBox(height: 20),

                    // Not a member? Register Now!
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not a member?'),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
