import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woman_grocerry/body/body_data.dart';
import 'package:woman_grocerry/constant/constant_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBarData(),
      body: BodyData(),
    );
  }

  AppBar appBarData() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "images/icons/back_arrow.svg",
          color: kTextColor,
          width: 20,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "images/icons/serarch.svg",
            color: kTextColor,
            width: 22,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "images/icons/cart.svg",
            color: kTextColor,
            width: 22,
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
