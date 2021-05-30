import 'package:flutter/material.dart';
import 'package:sevnotes2/App/home/tabs/notesTab/notes_tab.dart';
import 'package:sevnotes2/App/home/tabs/todoTab/todo_tab.dart';
import 'package:sevnotes2/App/home/tabs/whiteListTab/whitelist_tab.dart';

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
