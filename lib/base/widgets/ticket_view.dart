import 'package:flutter/cupertino.dart';
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
  const TicketView({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 195,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          children: [
            // ticket top part
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21)),
              ),
              child: Column(
                children: [
                  // show departure and destination with icons
                  Row(
                    children: [
                      TextStyleThird(text: ticket['from']['code']),
                      Expanded(child: Container()),
                      BigDot(),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(randomDivider: 7),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(Icons.local_airport_rounded,
                                    color: Colors.white)),
                          )
                        ],
                      )),
                      BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(text: ticket['to']['code'])
                    ],
                  ),
                  SizedBox(height: 3),
                  // show departure and destination names and time
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket['from']['name']),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: ticket['flying_time']),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                            text: ticket['to']['name'], align: TextAlign.end),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // circles and dots
            Container(
              height: 20,
              color: AppStyles.ticketOrange,
              child: Row(
                children: [
                  BigCircle(isRight: false),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                  )),
                  BigCircle(isRight: true)
                ],
              ),
            ),
            // ticket bottom part
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketOrange,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21)),
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
                          align: CrossAxisAlignment.start),
                      AppColumnTextLayout(
                          topText: ticket['departure_time'],
                          bottomText: "Departure time",
                          align: CrossAxisAlignment.center),
                      AppColumnTextLayout(
                          topText: ticket['number'],
                          bottomText: "Number",
                          align: CrossAxisAlignment.end),
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
