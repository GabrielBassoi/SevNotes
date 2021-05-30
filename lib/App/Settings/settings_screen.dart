import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Hero(
            tag: "settings",
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                splashRadius: 20,
                icon: Icon(Icons.keyboard_arrow_left),
                onPressed: Navigator.of(context).pop,
                iconSize: 30,
              ),
            ),
          ),
          title: Text("Settings"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, bottom: 2),
                child: Text("Theme's", style: TextStyle(fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 70,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 10,
                      color: Color.fromRGBO(100, 100, 100, 50),
                    ),
                  ]
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bool(Colors.blue, (){},
                        LinearGradient(colors: [Colors.white, Colors.white]),
                      ),
                      bool(Colors.grey[600], (){},
                        LinearGradient(colors: [Color.fromRGBO(46, 46, 46, 100), Color.fromRGBO(147, 147, 147, 100)]),
                      ),
                      bool(Colors.grey[600], (){},
                        LinearGradient(colors: [Color.fromRGBO(46, 46, 46, 100), Color.fromRGBO(255, 214, 10, 100)])
                      ),
                      bool(Colors.grey[600], (){},
                        LinearGradient(colors: [Color.fromRGBO(46, 46, 46, 100), Color.fromRGBO(255, 122, 0, 100)])
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bool(Color borderColor, Function click, LinearGradient gradient) {
    return GestureDetector(
      onTap: click,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3.5),
          borderRadius: BorderRadius.circular(25),
          gradient: gradient,
        )
      ),
    );
  }

}
