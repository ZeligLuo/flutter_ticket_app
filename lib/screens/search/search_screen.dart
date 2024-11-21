import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_tickets_tab.dart';
import 'package:ticket_app/screens/search/widgets/find_tickets_btn.dart';
import 'package:ticket_app/screens/search/widgets/ticket_promotion.dart';

import '../../base/utils/app_routes.dart';
import '../../base/widgets/app_double_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40),
          Text("What are\n you looking for?",
              style: AppStyles.headlineStyle1.copyWith(fontSize: 35)),
          SizedBox(height: 20),
          AppTicketsTab(firstTab: "Airline Tickets", secondTab: "Hotels",),
          SizedBox(height: 25),
          AppTextIcon(icon: Icons.flight_takeoff_rounded, text: "Departure"),
          SizedBox(height: 20),
          AppTextIcon(icon: Icons.flight_land_rounded, text: "Arrival"),
          SizedBox(height: 25),
          FindTicketsBtn(),
          SizedBox(height: 40),
          AppDoubleText(
            bigText: 'Upcoming Flights',
            smallText: 'View All',
            func: () => Navigator.pushNamed(context, AppRoutes.allTickets),
          ),
          SizedBox(height: 20),
          TicketPromotion()
        ],
      ),
    );
  }
}
