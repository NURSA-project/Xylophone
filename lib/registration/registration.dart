import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nursa/authentication/authentication.dart';
import 'package:nursa/authentication/user_model.dart';
import 'package:nursa/login_page/loginPage.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController uniqueIdController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 35),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 175, 146, 244),
                    ),
                    child: Image.asset("assets/image2.png"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 0.9),
                  const SizedBox(height: 0.3),
                  Container(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormFieldWidget(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please provide your full name";
                                }
                                return null;
                              },
                              hintText: "Name",
                              icon: Icons.person,
                              inputType: TextInputType.name,
                              controller: nameController,
                              obscureText: false),
                          TextFormFieldWidget(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please provide your full name";
                              }
                              return null;
                            },
                            hintText: "Email",
                            icon: Icons.email,
                            inputType: TextInputType.emailAddress,
                            controller: emailController,
                            obscureText: false,
                          ),
                          TextFormFieldWidget(
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value.length.isLowerThan(4) ||
                                  value.length.isGreaterThan(4)) {
                                return "Unique ID should be four digits";
                              }
                              return null;
                            },
                            hintText: "Unique ID",
                            icon: Icons.password_sharp,
                            inputType: TextInputType.emailAddress,
                            controller: uniqueIdController,
                            obscureText: true,
                          ),
                          TextFormFieldWidget(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please provide your password";
                              }
                              return null;
                            },
                            hintText: "Pasword",
                            icon: Icons.password,
                            inputType: TextInputType.number,
                            controller: passwordController,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  NavButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final UserModel userModel = UserModel(
                            userName: nameController.text,
                            password: passwordController.text,
                            uniqueId: uniqueIdController.text,
                            email: emailController.text);
                        await Authentication().signUpUserWithEmailAndPassword(
                            emailController.text, passwordController.text);
                        Get.to(
                          () => LoginPage(),
                        );
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        var user = auth.currentUser!;
                        var userID = user.uid;

                        await Authentication()
                            .createUserWithEmailAndPassword(userID, userModel);

                        _formKey.currentState!.reset();
                      } else {}
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginPage());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.validator,
    required this.icon,
    required this.inputType,
    required this.controller,
    required this.obscureText,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        keyboardType: inputType,
        controller: controller,
        decoration: InputDecoration(
          // prefix: Icon(icon),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 153, 39, 201)),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 153, 39, 201)),
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 175, 146, 244)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
