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
        appBar: AppBar(),
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
                        return 'Enter Your Username';
                      } else if (value.length >= 10) {
                        return 'Name too Long';
                      } else if (value.length <= 5) {
                        return 'Name too Short';
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
                        return 'Please Enter the Password';
                      } else if (value.length >= 10) {
                        return 'Name too Long';
                      } else if (value.length <= 5) {
                        return 'Name too Short';
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
                        return 'Please Enter the Password';
                      } else if (value.length >= 10) {
                        return 'Name too Long';
                      } else if (value.length <= 5) {
                        return 'Name too Short';
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
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Text(
                                  "Login Failed",
                                  style: TextStyle(fontSize: 15),
                                ),
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Text("Login Failed"),
                              );
                            });
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
