


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/my_ui/home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _signupPage();
  }
}
class _signupPage extends State<SignUp> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> data = {
    "firstName": null,
    "lastName": null,
    "email": null,
    "password": null,
  };



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      //alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 40, bottom: 5),
                      child: Text("First Name",
                          style: TextStyle(
                              color: Color.fromRGBO(111, 111, 111, 1)))),
                  Container(
                      //alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        top: 38,
                        left: 110,
                      ),
                      child: Text("Last Name",
                          style: TextStyle(
                              color: Color.fromRGBO(111, 111, 111, 1)))),
                ],
              ),
              Row(
                verticalDirection: VerticalDirection.up,
                children: [
                  SizedBox(
                    width: 160,
                    height: 60,
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && (value.isEmpty)) {
                          return 'Enter your First Name ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        data['firstName'] = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && (value.isEmpty)) {
                            return 'Enter your Last Name ';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          data['lastName'] = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text("E-mail",
                      style:
                          TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
              TextFormField(
                validator: (value) {
                  if (value != null &&
                      (value.isEmpty || !value.contains("@"))) {
                    return 'Enter Valid Email';
                  }
                  return null;
                },
                onSaved: (value) {
                  data['email'] = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  hintText: 'Enter an E-mail',
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text("Password",
                      style:
                          TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
              TextFormField(
                controller: _pass,
                validator: (value) {
                  if (value != null && (value.length < 8)) {
                    return 'Enter Strong Password ';
                  }
                  return null;
                },
                onSaved: (value) {
                  data['Password'] = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  hintText: 'Enter a Password',
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text("Confirm Password",
                      style:
                          TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
              TextFormField(
                controller: _confirmPass,
                validator: (value) {
                  if (value != null && (value != _pass.text)) {
                    return 'Password does not match ';
                  }
                  return null;
                },
                onSaved: (value) {
                  data['password'] = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: SizedBox(
                  width: 345,
                  height: 45,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(26, 188, 0, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ))),
                    onPressed: () {
                      _formKey.currentState?.validate() == true
                          ? signUpAuth()
                          : "";
                      /*Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));*/
                    },
                    child: const Text("Login",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Divider(color: Color.fromRGBO(151, 151, 151, 1))),
                  Text("or continue with",
                      style:
                          TextStyle(color: Color.fromRGBO(151, 151, 151, 1))),
                  Expanded(
                      child: Divider(color: Color.fromRGBO(151, 151, 151, 1))),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 120),
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/google.svg",
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/Facebook.svg",
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUpAuth() {
    _formKey.currentState?.save();
    http
        .post(
      Uri.parse(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    )
        .then((response) {
      print(response.statusCode);
      if (jsonDecode(response.body)['type']
          .toString()
          .toLowerCase()
          .contains("success")) {
        print(response.body);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Failed to Signup'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Please enter valid Email and Password'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }
}
