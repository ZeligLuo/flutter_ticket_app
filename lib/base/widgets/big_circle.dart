import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class BigCircle extends StatelessWidget {
  final bool isRight;

  const BigCircle({super.key, required this.isRight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 12,
      child: DecoratedBox(decoration: BoxDecoration(
          color: AppStyles.bgColor,
          borderRadius: isRight?BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10)
          ):BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10)
          )
      )),
    );
  }
}
