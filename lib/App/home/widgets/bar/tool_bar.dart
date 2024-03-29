import 'dart:async';
import 'package:animated_card/animated_card.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:sevnotes2/App/Settings/settings_screen.dart';
import 'package:sevnotes2/App/home/widgets/bar/Search/search.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class ToolBar extends StatefulWidget {
  final SettingsStore setStore;
  ToolBar(this.setStore);
  @override
  _ToolBarState createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  DateTime time = DateTime.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time.second != DateTime.now().second) {
        setState(() {
          time = DateTime.now();
        });
      }
    });
  }

  Widget timeText(text, double fontSize, color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: "Roboto",
        decoration: TextDecoration.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> month = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July",
      "Aug", "Sept", "Oct", "Nov", "Dec",
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedCard(
          direction: AnimatedCardDirection.left,
          child: Container(
              height: 70,
              width: size.width * 0.58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.setStore.theme.layout,
              ),
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => SettingsScreen()));
                      },
                      child: Hero(
                          tag: "settings",
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.settings,
                              color: widget.setStore.theme.primary,
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SearchWidget(widget.setStore),
                    )
                  ],
                ),
              )),
        ),
        AnimatedCard(
          direction: AnimatedCardDirection.top,
          child: Container(
            padding: const EdgeInsets.all(11),
            height: 70,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.setStore.theme.layout,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                timeText("${time.format("H:i:s")}", 20, widget.setStore.theme.primary),
                timeText("${month[(time.month) - 1]} ${time.day}, ${time.year}",
                    12, widget.setStore.theme.clockDate
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
