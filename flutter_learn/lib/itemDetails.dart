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
      child: ListView(
        children: [
        Image.asset(
          'images/testImg.jpg',
          width: MediaQuery.of(context).size.width,
          height: 240,
          fit: BoxFit.cover,
        ),

        titleSection ,
        buttonSection ,
        textSection
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

Column buildButton (Color color, IconData icon, String label){

  return Column(
    mainAxisAlignment  : MainAxisAlignment.center ,
    children: [
    Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),

  ],);
}



Widget buttonSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children : [
      buildButton(Colors.blue, Icons.call, 'CALL') ,
      buildButton(Colors.blue,  Icons.near_me, 'ROUTE') ,
      buildButton(Colors.blue, Icons.share, 'SHARE')
  ]
)
);

Widget textSection = Container (
  padding: EdgeInsets.all(32),
  child: Text(
       'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true
  )
,);


