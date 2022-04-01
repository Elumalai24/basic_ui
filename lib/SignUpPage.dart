import 'package:flutter/material.dart';

import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();

  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "SignUp Page",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  width: 100,
                ),
                Container(
                  width: 300,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your username';
                      } else if (value.length >= 10) {
                        return 'Name too long';
                      } else if (value.length <= 5) {
                        return 'Name too short';
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      hintText: 'ENTER USERNAME',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(
                            5,
                          )),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    controller: password,
                    obscureText: !checkboxvalue,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter the password';
                      } else if (value.length >= 10) {
                        return 'name too long';
                      } else if (value.length <= 5) {
                        return 'name too short';
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        size: 25,
                        color: Colors.white,
                      ),
                      hintText: 'ENTER PASSWORD',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(
                            5,
                          )),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    controller: conpassword,
                    obscureText: !checkboxvalue,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter the password';
                      } else if (value.length >= 10) {
                        return 'name too long';
                      } else if (value.length <= 5) {
                        return 'name too short';
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        size: 25,
                        color: Colors.white,
                      ),
                      hintText: 'CONFIRM PASSWORD',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(
                            5,
                          )),
                    ),
                  ),
                ),
                OutlinedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else if (password.text != conpassword.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              'LOGIN FAILED',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            duration: const Duration(seconds: 1),
                            action:
                                SnackBarAction(label: 'OK', onPressed: () {}),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              'LOGIN FAILED',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            duration: const Duration(seconds: 1),
                            action:
                                SnackBarAction(label: 'OK', onPressed: () {}),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )),
              ],
            ),
          ),
        ));
  }
}
