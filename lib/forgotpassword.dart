import 'package:flutter/material.dart';
import 'package:tryapp/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool changeButton = false;
  var value1;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Image.asset(
              "assets/images/log_in.png",
              height: 286,
              width: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Reset your password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 42),
              child: Column(children: [
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter new password",
                    labelText: "New password",
                  ),
                  validator: (value) {
                    value1 = value;
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value.length < 6) {
                      return "Password's length should atleast be 6";
                    } else if (value.length >= 6) {
                      changeButton = true;
                    } else {
                      return null;
                    }
                    return null;
                  },
                ),
                15.heightBox,
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Re enter new password",
                    labelText: "Enter again",
                  ),
                  validator: (value) {
                    if (value == value1) {
                      changeButton = true;
                    } else {
                      changeButton = false;
                      return "enter correctly";
                    }
                    return null;
                  },
                ),
                HeightBox(40),
                Material(
                  borderRadius:
                      BorderRadius.circular(changeButton == true ? 70 : 8.3),
                  color: const Color.fromARGB(255, 87, 59, 243),
                  shadowColor: const Color.fromARGB(255, 165, 164, 164),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(),
                      width: changeButton ? 60 : 310,
                      height: changeButton ? 64 : 65,
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: "Go back".text.make(),
                )
              ]),
            )
          ],
        )),
      ),
    );
  }
}
