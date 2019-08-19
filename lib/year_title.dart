/*
created by Vishnuvardhan reddy
date 16 august 2019
 */
import 'package:flutter/material.dart';

class YearTitle extends StatelessWidget {
  const YearTitle(
    this.year,
  );

  final int year;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),

        child: Text(
          year.toString(),
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
