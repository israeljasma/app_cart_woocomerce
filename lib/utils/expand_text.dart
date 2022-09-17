import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExpandText extends StatefulWidget {
  const ExpandText({
    Key? key,
    required this.labelHeader,
    required this.desc,
    required this.shortDesc,
  }) : super(key: key);

  final String labelHeader;
  final String desc;
  final String shortDesc;

  @override
  State<ExpandText> createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  bool descTextShowFlag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelHeader,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Html(
            data: descTextShowFlag ? widget.desc : widget.shortDesc,
            style: {
              "div": Style(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                fontSize: FontSize.medium,
              ),
            },
          ),
          Align(
            child: GestureDetector(
              child: Text(
                descTextShowFlag ? "Mostrar Menos" : "Mostrar Más",
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                setState(() {
                  descTextShowFlag = !descTextShowFlag;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
