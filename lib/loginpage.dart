import 'package:flutter/material.dart';
import 'package:tryapp/forgotpassword.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:tryapp/utils/routes.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 65.0,left: 30),
                  child: Image.asset(
                    height: 250,
                    width:150,
                    "assets/images/sayhello.png",
                      
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 42,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter user name",
                        labelText: "User Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 18.6,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: " Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password's length should atleast be 6";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 70 : 8.3),
                      color: const Color.fromARGB(255, 87, 59, 243),
                      shadowColor: const Color.fromARGB(255, 165, 164, 164),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(),
                          width: changeButton ? 60 : 300,
                          height: changeButton ? 64 : 65,
                          child: changeButton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    InkWell(
                      child: const Text(
                        'forgot password?',
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text(
                    //     "SignUp",
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    // InkWell(
                    //   child: const Padding(
                    //     padding: EdgeInsets.all(16.0),
                    //     child: Text('forgot password'),
                    //   ),
                    //   onTap: () => launchUrl(MyRoutes() as Uri),
                    // )
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
