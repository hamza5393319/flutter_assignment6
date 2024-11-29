import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/screeens/property_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remmberme = false;
  bool _isPasswordHidden = true; // State variable to toggle password visibility

  // Create a GlobalKey for form validation
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey, // Set the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Login to Your Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _emailController, // Use the controller here
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // Email validation
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Check if the email format is valid
                    String pattern =
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _passwordController, // Use the controller here
                  obscureText: _isPasswordHidden, // Use the state variable here
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden; // Toggle the value
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // Password validation
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: remmberme,
                    onChanged: (bool? value) {
                      setState(() {
                        remmberme = value ?? false;
                      });
                    },
                  ),
                  const Text("Remember me"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (_formKey.currentState?.validate() ?? false) {
                    // If the form is valid, navigate to PropertyScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PropertyScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 140),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 50),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot the password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 1),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("or continue with"),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                    color: Colors.blue,
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata),
                    color: Colors.red,
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.apple),
                    color: Colors.black,
                    iconSize: 30,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
