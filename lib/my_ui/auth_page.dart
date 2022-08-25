import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/my_ui/login_page.dart';
import 'package:plant_app/my_ui/signup_page.dart';

class AuthPage extends StatelessWidget {
  final LoginPage loginPage = new LoginPage();
  final SignUp signUp = new SignUp();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/image 68 plant.svg"),
            ),
            SizedBox(
              height: 38,
              child: SvgPicture.asset("assets/Group 1000003301.svg"),
            ),
            SizedBox(
              height: 40,
              child: DefaultTabController(
                length: 3,
                child: Scaffold(),
              ),
            ),
            Container(
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Color.fromRGBO(26, 188, 0, 1)),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Color.fromRGBO(26, 188, 0, 1)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: IntrinsicHeight(
                  child: TabBarView(
                    children: [signUp, loginPage],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset("assets/image 68 rounded.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
