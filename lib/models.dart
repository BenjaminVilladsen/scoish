import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleWidget extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTitleWidget({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        fontSize: 50,
        color: color,
      ),
    );
  }
}

//used in header fx
class CustomSubTitleWidget extends StatelessWidget {
  final String text;
  final Color color;
  const CustomSubTitleWidget(
      {Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        fontSize: 16,
        color: color,
      ),
    );
  }
}

class HeaderButton extends StatefulWidget {
  final String text;
  final Color color;
  final Function onPressed;
  const HeaderButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onPressed();
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: CustomSubTitleWidget(
            text: widget.text,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}

class ContentTextWidget extends StatelessWidget {
  final String text;
  const ContentTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        fontSize: 24,
        color: Colors.black,
      ),
    );
  }
}

class ContentShowerWidget extends StatefulWidget {
  final String title;
  final String bodyText;
  const ContentShowerWidget({
    Key? key,
    required this.title,
    required this.bodyText,
  }) : super(key: key);

  @override
  State<ContentShowerWidget> createState() => _ContentShowerWidgetState();
}

class _ContentShowerWidgetState extends State<ContentShowerWidget> {
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
        ContentTextWidget(text: widget.bodyText),
      ]),
    );
  }
}

class HeaderIcon extends StatefulWidget {
  final Function onPressed;
  final Widget icon;

  const HeaderIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  State<HeaderIcon> createState() => _HeaderIconState();
}

class _HeaderIconState extends State<HeaderIcon> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onPressed();
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(child: widget.icon),
        ),
      ),
    );
  }
}
