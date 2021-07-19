import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/App/EditNote/edit_note.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';

import 'widgets/bar/bar.dart';
import 'widgets/bar/tab_view.dart';
import 'widgets/bar/tool_bar.dart';

class HomeNoteScreen extends StatefulWidget {
  @override
  _HomeNoteScreenState createState() => _HomeNoteScreenState();
}

class _HomeNoteScreenState extends State<HomeNoteScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  final HomeStore store = GetIt.I<HomeStore>();
  ReactionDisposer disposer;
  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_getInd);
    store.setTabIndex(0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = autorun(
      (_) {
        if (store.searchText == "" ||
            store.searchText.isEmpty ||
            store.searchText == null) {
          store.setNotesList(store.primaryList);
        } else {
          List l = store.primaryList
              .where((note) =>
                  note.title
                      .toLowerCase()
                      .contains(store.searchText.toLowerCase()) ||
                  note.body
                      .toLowerCase()
                      .contains(store.searchText.toLowerCase()))
              .toList();
          store.setNotesList(l);
        }
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: setStore.theme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: ToolBar(setStore),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            child: BarTab(tabController, setStore),
          ),
          Observer(builder: (_) {
            return Expanded(
              child: Scaffold(
                backgroundColor: setStore.theme.background,
                body: TabView(tabController),
                floatingActionButton: store.tabIndex != 0
                    ? null
                    : FloatingActionButton(
                        backgroundColor: setStore.theme.layout,
                        child: Icon(Icons.add, color: setStore.theme.primary, size: 27,),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => EditNote()));
                        },
                      ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void _getInd() {
    store.setTabIndex(tabController.index);
  }
}
