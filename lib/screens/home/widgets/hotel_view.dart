import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class HotelView extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      height: 300,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${hotel['image']}"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              hotel['place'],
              style:
                  AppStyles.headlineStyle1.copyWith(color: AppStyles.kakiColor),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              hotel['destination'],
              style:
              AppStyles.headlineStyle3.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "\$${hotel['price']}/Night",
              style:
              AppStyles.headlineStyle2.copyWith(color: AppStyles.kakiColor),
            ),
          ),
        ],
      ),
    );
  }
}
