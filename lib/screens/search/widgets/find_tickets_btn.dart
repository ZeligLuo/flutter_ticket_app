import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class FindTicketsBtn extends StatelessWidget {
  const FindTicketsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppStyles.findTicketsColor),
      child: Center(
          child: Text(
        "Find tickets",
        style: AppStyles.textStyle.copyWith(color: Colors.white),
      )),
    );
  }
}
