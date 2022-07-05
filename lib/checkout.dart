import 'package:flutter/material.dart';

import 'models.dart';

class CheckOutPage extends StatefulWidget {
  final String title;

  const CheckOutPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: (screenWidth / screenHeight) < 1.6
          ? const EdgeInsets.fromLTRB(30, 100, 30, 0)
          : const EdgeInsets.fromLTRB(400, 100, 400, 0),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        CustomTitleWidget(
          text: widget.title,
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
