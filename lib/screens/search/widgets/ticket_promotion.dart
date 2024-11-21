import 'package:flutter/material.dart';

import '../../../base/res/media.dart';
import '../../../base/res/styles/app_styles.dart';

class TicketPromotion extends StatelessWidget {
  const TicketPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: size.width * 0.42,
          height: 435,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200, blurRadius: 1, spreadRadius: 2)
              ]),
          child: Column(
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppMedia.planeSit))),
              ),
              SizedBox(height: 10),
              Text(
                "20% discount on the early booking of this flight. Don't miss.",
                style: AppStyles.headlineStyle2,
              )
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: size.width * 0.44,
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFF3AB8B8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Discount \nfor survey",
                          style: AppStyles.headlineStyle2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 10),
                      Text(
                          "Take the survey about our services and get discount.",
                          style: AppStyles.headlineStyle2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18))
                    ],
                  ),
                ),
                Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 20, color: AppStyles.circleColor)),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: size.width * 0.44,
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFFEC6545)),
              child: Column(
                children: [
                  Text(
                    "Take Promotion",
                    style:
                        AppStyles.headlineStyle2.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "✨", style: TextStyle(fontSize: 30)),
                    TextSpan(text: "🎁", style: TextStyle(fontSize: 55)),
                    TextSpan(text: "🎉", style: TextStyle(fontSize: 30))
                  ]))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
