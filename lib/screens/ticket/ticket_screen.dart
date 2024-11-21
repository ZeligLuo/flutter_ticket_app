import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_layout_builder_widget.dart';
import 'package:ticket_app/screens/home/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_tickets_tab.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_positioned_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if(ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("Ticket Detail"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              AppTicketsTab(
                firstTab: "Upcoming",
                secondTab: "Previous",
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(left: 16),
                  child: TicketView(
                    ticket: ticketList[ticketIndex],
                    isColor: true,
                  )), // Ticket info display
              SizedBox(height: 1),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketWhite,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "Test Test",
                          bottomText: "Passenger",
                          align: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "123456789",
                          bottomText: "Passport",
                          align: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ), // Passenger name & passport
                    SizedBox(height: 20),
                    AppLayoutBuilderWidget(
                        randomDivider: 15, width: 5, isColor: false),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "246813579",
                          bottomText: "Number of E-ticket",
                          align: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "A7531468",
                          bottomText: "Booking Code",
                          align: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ), // Ticket number
                    SizedBox(height: 20),
                    AppLayoutBuilderWidget(
                        randomDivider: 15, width: 5, isColor: false),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visaCard,
                                  scale: 11,
                                ),
                                Text(
                                  " *** 1234",
                                  style: AppStyles.headlineStyle3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment Method",
                              style: AppStyles.headlineStyle4,
                            )
                          ],
                        ),
                        AppColumnTextLayout(
                          topText: "\$299.99",
                          bottomText: "Price",
                          align: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ), // Payment info
                  ],
                ),
              ), // Addition ticket info
              SizedBox(height: 1),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: AppStyles.ticketWhite,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(21),
                        bottomLeft: Radius.circular(21))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      height: 70,
                      data: 'google.com',
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,
                    ),
                  ),
                ),
              ), // Barcode
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(left: 16),
                  child: TicketView(
                    ticket: ticketList[ticketIndex],
                  )),
            ],
          ),
          TicketPositionedCircle(pos: true),
          TicketPositionedCircle(pos: false)
        ],
      ),
    );
  }
}
