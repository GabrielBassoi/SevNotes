import 'dart:async';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:sevnotes2/App/Settings/settings_screen.dart';

class ToolBar extends StatefulWidget {
  @override
  _ToolBarState createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {

  DateTime time = DateTime.now();


  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if(time.second != DateTime.now().second) {
        setState(() {
          time = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> month = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "June",
      "July",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec",
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 70,
            width: size.width * 0.53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  color: Color.fromRGBO(100, 100, 100, 50),
                )
              ]
            ),
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsScreen()));
                    },
                    child: Hero(
                      tag: "settings",
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.settings),
                      )
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.search, size: 25,),
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            )
        ),

        Container(
            padding: const EdgeInsets.all(11),
            height: 70,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  color: Color.fromRGBO(100, 100, 100, 50)
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${time.format("H:i:s")}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Roboto",
                      decoration: TextDecoration.none
                  ),
                ),
                Text(
                  "${month[(time.month)-1]} ${time.day}, ${time.year}",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Roboto",
                      decoration: TextDecoration.none
                  ),
                )
              ],
            )
        ),
      ],
    );
  }
}
