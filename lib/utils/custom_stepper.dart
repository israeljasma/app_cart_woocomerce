import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    Key? key,
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.iconsize,
    required this.value,
    required this.onChaned,
  }) : super(key: key);

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconsize;
  int value;
  final ValueChanged<dynamic> onChaned;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(
                () {
                  widget.value = widget.value == widget.lowerLimit
                      ? widget.lowerLimit
                      : widget.value -= widget.stepValue;

                  widget.onChaned(widget.value);
                },
              );
            },
            icon: const Icon(Icons.remove),
          ),
          Container(
            width: widget.iconsize,
            child: Text(
              '${widget.value}',
              style: TextStyle(
                fontSize: widget.iconsize * 0.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.value = widget.value == widget.upperLimit
                    ? widget.upperLimit
                    : widget.value += widget.stepValue;
                widget.onChaned(widget.value);
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
