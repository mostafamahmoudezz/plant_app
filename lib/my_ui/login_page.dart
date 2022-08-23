import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/my_ui/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginpage();
  }
}

class _loginpage extends State<LoginPage> {
  Map<String, dynamic> form = {"password": null, "email": null};
  //Map<String, dynamic> otp = {"message": null};

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: ListView(children: [
          Column(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("Email",
                      style:
                          TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
              TextFormField(
                validator: (value) {
                  if (value != null &&
                      (value.isEmpty || !value.contains("@"))) {
                    return 'Email is not valid';
                  }
                  return null;
                },
                onSaved: (value) {
                  form['email'] = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  hintText: 'Enter an Email',
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 30),
                  child: Text("Password",
                      style:
                          TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
              TextFormField(
                validator: (value) {
                  if (value != null && (value.isEmpty)) {
                    return 'Enter your password ';
                  }
                  return null;
                },
                onSaved: (value) {
                  form['password'] = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  hintText: 'Enter a Password',
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
                      _formKey.currentState?.validate() == true ?

                      loginAuth() : "";

                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

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
        ]),
      ),
    );
  }

  void loginAuth() {
    _formKey.currentState?.save();
    http
        .post(
      Uri.parse(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(form),
    )
        .then((response) {
      print(response.statusCode);
      if (jsonDecode(response.body)['type']
          .toString()
          .toLowerCase()
          .contains("success")) {
        print(response.body);
      } else {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Faild to login'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('wrong email or password'),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () {
                        http
                            .post(
                              Uri.parse(
                                  'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/forget-password'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(
                                  <String, dynamic>{"email": form['email']}),
                            )
                            .then((response) => print(response.body));
                        onSaved: (value) {
                          form['message'] = value;
                        };
                       /* AlertDialog(
                          title: const Text('Forget password'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('OTP sent to your email'),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        );*/
                      },
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
