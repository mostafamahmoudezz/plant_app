import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Center(
            child: Container(padding: EdgeInsets.all(40),
              child: SvgPicture.asset("assets/Group 1000003301.svg"),
            ),
          ),
          Text("Home page "),
        ],
      ),
    );
  }
}
