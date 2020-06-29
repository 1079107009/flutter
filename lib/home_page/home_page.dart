import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var image = AssetImage("assets/home_page/bg.png");

  var startInf = ButtonInfo();
  var exitInf = ButtonInfo();

  //自定义按钮的方法
  Widget buildButton(String text, ButtonInfo inf, Function() lambda) {
    double width = MediaQuery.of(context).size.width;
    var stack = Stack(alignment: Alignment.center, children: <Widget>[
      Image.asset(
        inf.buttonImage,
        width: width / 5,
        fit: BoxFit.cover,
      ),
      Text(text,
          style: TextStyle(
              fontFamily: 'zcool-gdh',
              fontSize: 20,
              color: Color.fromRGBO(inf.red, inf.green, inf.blue, 1))),
    ]);
    var button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() {
          inf.buttonImage = "assets/home_page/menu_button1.png";
          inf.red = 243;
          inf.green = 250;
          inf.blue = 253;
          lambda();
        }),
        onTapDown: (_) => setState(() {
          inf.buttonImage = "assets/home_page/menu_button0.png";
          inf.red = 136;
          inf.green = 83;
          inf.blue = 27;
        }),
        onTapCancel: () => setState(() {
          inf.buttonImage = "assets/home_page/menu_button1.png";
          inf.red = 243;
          inf.green = 250;
          inf.blue = 253;
        }),
        child: stack,
      ),
    );
    return button;
  }

  @override
  Widget build(BuildContext context) {
    var startButton = buildButton("Start", startInf,
        () => Navigator.pushNamed(context, "/battle", arguments: "a message"));
    var exitButton = buildButton("Exit", exitInf, () => exit(0));
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        startButton,
        exitButton,
      ],
    );
    var padding = Padding(
      padding:
          EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 2, 0, 0),
      child: row,
    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: padding,
    );
  }
}

class ButtonInfo {
  var buttonImage = "assets/home_page/menu_button1.png";
  var red = 243, green = 250, blue = 253;

  ButtonInfo();
}
