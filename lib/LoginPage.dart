import 'package:flutter/material.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  "Login Page",
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
                      }
                      if (value.length >= 10) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Checkbox(
                      value: checkboxvalue,
                      focusColor: Colors.pink,
                      hoverColor: Colors.pink,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors
                                .pink; // the color when checkbox is selected;
                          }
                          return Colors
                              .blue; //the color when checkbox is unselected;
                        },
                      ),
                      onChanged: (value) {
                        setState(() {
                          checkboxvalue = value!;
                        });
                      },
                      checkColor: Colors.blue,
                    ),
                    Text(
                      "Show Password",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
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
                      'Login',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )),
              ],
            ),
          ),
        ));
  }
}
