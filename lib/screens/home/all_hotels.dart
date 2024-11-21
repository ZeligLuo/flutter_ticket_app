import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/screens/home/widgets/hotel_view.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("All Hotels"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.9),
              itemCount: hotelList.length,
              itemBuilder: (context, index) {
                var singleHotel = hotelList[index];
                return HotelGridView(hotel: singleHotel);
              }),
        ),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelGridView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.hotelDetail);
      },
      child: Container(
        // width: size.width * 0.6,
        height: 350,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: AppStyles.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
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
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                hotel['place'],
                style:
                AppStyles.headlineStyle3.copyWith(color: AppStyles.kakiColor),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    hotel['destination'],
                    style:
                    AppStyles.headlineStyle3.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(width: 5,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "\$${hotel['price']}/Night",
                    style:
                    AppStyles.headlineStyle4.copyWith(color: AppStyles.kakiColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
