import 'package:flutter/material.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class BarTab extends StatelessWidget {
  final TabController tabController;
  final SettingsStore setStore;
  BarTab(this.tabController, this.setStore);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: setStore.theme.layout,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          indicatorPadding:
              EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 10),
          indicator: BoxDecoration(
            color: setStore.theme.background,
            borderRadius: BorderRadius.circular(20),
          ),
          tabs: [
            tabb("Notes", Icons.article, setStore),
            tabb("Whitelist", Icons.star, setStore),
            tabb("To-do", Icons.done, setStore),
          ],
        ),
      ),
    );
  }
}

Widget tabb(String title, IconData icon, SettingsStore setStore) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: setStore.theme.text,),
      Text(title, style: TextStyle(fontSize: 15, color: setStore.theme.text)),
    ],
  );
}
