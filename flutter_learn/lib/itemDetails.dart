import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text("Details"),
      ) ,
      body : Container(
      child: Column(children: [
        Image.asset(
          'images/testImg.jpg',
          width: MediaQuery.of(context).size.width,
          height: 240,
          fit: BoxFit.cover,
        ),

        titleSection ,
      ]),
    )
    );
  }


}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
  children : [
      Expanded( 
        child : Column(
          children : [
             Container(
             padding: const EdgeInsets.only(bottom: 8),
             child :Text( 'Oeschinen Lake Campground' , style : TextStyle(fontWeight: FontWeight.bold)) 
             ),
          ]
        )
      )


  ]
)
);


