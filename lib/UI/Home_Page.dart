
import 'package:flutter/material.dart';
import 'package:queryapp_revised/UI/Login_Page.dart';
import 'package:queryapp_revised/UI/Signin_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final phone = _phoneController.text;
      print("Email: $email, Phone: $phone");

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-in successful!')),
      );

      // Navigate to the SignInPage
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const SignInPage()),
      );
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {

      final email = _emailController.text;
      final phone = _phoneController.text;
      print("Email: $email, Phone: $phone");

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      // Navigate to the LoginPage
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Chats()),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.network(
                  "https://imgs.search.brave.com/9IUtBp7CeXyNcfNQmNRJPYBd09k2_O900FRbDnl6VCs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTA2/MzIwMjgzNi9waG90/by9xdWVzdGlvbi1t/YXJrcy1vbi13b29k/ZW4tYmxvY2std2hp/dGUtYmFja2dyb3Vu/ZC5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9UGZJUXFZaWxB/RmRYMTZwUG5FZmdY/VHpZOEJwUFRnaE1i/WC16cUxkanVwOD0", // Replace with your image URL
                  height: 400,
                  width: 500,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Query App",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email Input
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your email",
                          contentPadding: EdgeInsets.all(12.0),
                          hintStyle: TextStyle(color: Colors.grey), // Optional: Change hint text color
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white), // Set input text color to white
                        validator: _validateEmail,
                      ),
                    ),
                    // Phone Input
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your phone number",
                          contentPadding: EdgeInsets.all(12.0),
                          hintStyle: TextStyle(color: Colors.grey), // Optional: Change hint text color
                        ),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white), // Set input text color to white
                        validator: _validatePhone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Login and Sign-in Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Login Button
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Blue background
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white), // Set text color to white
                      ),
                    ),
                    const SizedBox(width: 20), // Spacing between buttons
                    // Sign-in Button
                    ElevatedButton(
                      onPressed: _signIn, // Use the _signIn method for navigation
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // White background
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white), // Set text color to white
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage {
  const LoginPage();
}
