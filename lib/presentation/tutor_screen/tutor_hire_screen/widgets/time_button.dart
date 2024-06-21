import 'package:flutter/material.dart';

import '../../../../theme/app_decoration.dart';

class TimeButton extends StatefulWidget {
  final String time;
  final bool isSelected;
  final Function(String) onSelected;

  const TimeButton({
    Key? key,
    required this.time,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.time);
      },
      child: Container(
        decoration: widget.isSelected
            ? AppDecoration.outlineOnErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 9),
        child: Text(
          widget.time,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
