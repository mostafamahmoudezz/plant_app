import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 60),
                child: Text("Email",
                    style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
            TextFormField(
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
                    style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
                hintText: 'Enter a Password',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              //color: Color.fromRGBO(26, 188, 0, 1),
              child: SizedBox(
                width: 345,
                height: 45,
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(26, 188, 0, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
                  onPressed: () {
                    debugPrint('Received click');
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
                    style: TextStyle(color: Color.fromRGBO(151, 151, 151, 1))),
                Expanded(
                    child: Divider(color: Color.fromRGBO(151, 151, 151, 1))),
              ]),
            ),
            Container(padding: EdgeInsets.only(left:120),
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
    );
  }
}
