import 'package:flutter/material.dart';

import 'CustomTextStyle.dart';

class DottedLine extends StatelessWidget {
  double leftMargin = 16.0;
  double rightMargin = 16.0;
  double topMargin = 4.0;

  DottedLine(this.leftMargin, this.rightMargin, this.topMargin);

  @override
  Widget build(BuildContext context) {
    return createDottedLine();
  }

  createDottedLine() {
    return Container(
      margin: EdgeInsets.only(right: rightMargin, left: leftMargin, top: topMargin),
      child: LayoutBuilder(builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dottedWidth = 4.0;
        final dashCount = (boxWidth / dottedWidth).floor();
        return Flex(
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return Text(
              ".",
              style:
                  CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey),
            );
          }),
        );
      }),
    );
  }
}
