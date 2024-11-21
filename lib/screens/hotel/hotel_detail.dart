import 'package:flutter/material.dart';

class HotelDetail extends StatelessWidget {
  const HotelDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(bottom: 50, left: 20),
              title: Text("Hotel Title"),
              background: Image.network("https://via.placeholder.com/600x400"),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.")),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text("More Images",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(8),
                        child: Image.network(
                            "https://via.placeholder.com/200x200"));
                  }),
            )
          ]))
        ],
      ),
    );
  }
}
