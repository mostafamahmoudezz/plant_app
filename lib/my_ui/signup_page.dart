import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              children: [
                SizedBox(
                  width: 160,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 150,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(10),
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
                    style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
            TextFormField(
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
                    style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
            TextFormField(
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
                    style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)))),
            TextFormField(
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
    );
  }
}
