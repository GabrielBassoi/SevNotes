import 'package:flutter/material.dart';

class BarTab extends StatelessWidget {
  final TabController tabController;
  BarTab(this.tabController);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 0,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          indicatorPadding:
              EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 10),
          indicator: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(25),
          ),
          tabs: [
            tabb("Notes", Icons.article),
            tabb("Whitelist", Icons.star),
            tabb("To-do", Icons.done),
          ],
        ),
      ),
    );
  }
}

Widget tabb(String title, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon),
      Text(title, style: TextStyle(fontSize: 15)),
    ],
  );
}
