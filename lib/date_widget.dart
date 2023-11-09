/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final bool isSelected;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            width: width,
            height: 65,
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: selectionColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      new DateFormat("E", locale)
                          .format(date)
                          .toUpperCase(), // WeekDay
                      style: dayTextStyle),
                  Text(date.day.toString(), // Date
                      style: dateTextStyle),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (isSelected == true)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            )
          else
            SizedBox(),
        ],
      ),
      onTap: () {
        onDateSelected?.call(this.date);
      },
    );
  }
}
