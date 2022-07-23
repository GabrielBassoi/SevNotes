import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/App/Settings/widgets/settings_app_bar.dart';
import 'package:sevnotes2/App/Settings/widgets/settings_body.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsStore setStore = GetIt.I<SettingsStore>();
  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => setStore.themeIndex, (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: setStore.theme.background,
        appBar: SettingsAppBar(context, setStore),
        body: SettingsBody(),
      ),
    );
  }
}
