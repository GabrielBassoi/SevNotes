import 'package:flutter/material.dart';

class BarTab extends StatelessWidget {

  final TabController tabController;
  BarTab(this.tabController);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 10,
              color: Color.fromRGBO(100, 100, 100, 50),
            ),
          ],
        ),
        child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 10,
                color: Color.fromRGBO(100, 100, 100, 50)
              )
            ],
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(25),
          ),
          indicatorColor: Colors.transparent,
          tabs: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.article),
                Text("Notes", style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star),
                Text("Whitelist", style: TextStyle(fontSize: 17)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.done),
                Text("To-do", style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
