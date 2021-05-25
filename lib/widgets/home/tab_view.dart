import 'package:flutter/material.dart';
import 'package:sevnotes2/tabs/notes_tab.dart';
import 'package:sevnotes2/tabs/todo_tab.dart';
import 'package:sevnotes2/tabs/whitelist_tab.dart';

class TabView extends StatelessWidget {

  final TabController tabController;
  TabView(this.tabController);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        NotesTab(),
        WhitelistTab(),
        TodoTab(),
      ],
    );
  }
}
