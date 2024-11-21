import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layout_builder_widget.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;

  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 180,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen ? 0 : 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ticket top part
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor == null
                    ? AppStyles.ticketBlue
                    : AppStyles.ticketWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21)),
              ),
              child: Column(
                children: [
                  // show departure and destination with icons
                  Row(
                    children: [
                      TextStyleThird(
                        text: ticket['from']['code'],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(
                                randomDivider: 7, isColor: isColor),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(Icons.local_airport_rounded,
                                    color: isColor == null
                                        ? Colors.white
                                        : AppStyles.planeColor2)),
                          )
                        ],
                      )),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      TextStyleThird(
                          text: ticket['to']['code'], isColor: isColor)
                    ],
                  ),
                  SizedBox(height: 3),
                  // show departure and destination names and time
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                            text: ticket['from']['name'], isColor: isColor),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(
                          text: ticket['flying_time'], isColor: isColor),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                            text: ticket['to']['name'],
                            align: TextAlign.end,
                            isColor: isColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // circles and dots
            Container(
              height: 20,
              color: isColor == null
                  ? AppStyles.ticketOrange
                  : AppStyles.ticketWhite,
              child: Row(
                children: [
                  BigCircle(isRight: false),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                    isColor: isColor,
                  )),
                  BigCircle(isRight: true)
                ],
              ),
            ),
            // ticket bottom part
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor == null
                    ? AppStyles.ticketOrange
                    : AppStyles.ticketWhite,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                    bottomRight: Radius.circular(isColor == null ? 21 : 0)),
              ),
              child: Column(
                children: [
                  // show departure and destination
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        topText: ticket['date'],
                        bottomText: "Date",
                        align: CrossAxisAlignment.start,
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        topText: ticket['departure_time'],
                        bottomText: "Departure time",
                        align: CrossAxisAlignment.center,
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        topText: ticket['number'],
                        bottomText: "Number",
                        align: CrossAxisAlignment.end,
                        isColor: isColor,
                      ),
                      /*Expanded(child: Container()),
                      Text("08:00 AM",
                          style: AppStyles.headlineStyle3
                              .copyWith(color: Colors.white)),
                      Expanded(child: Container()),
                      Text(
                        "23",
                        style: AppStyles.headlineStyle3
                            .copyWith(color: Colors.white),
                      )*/
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
