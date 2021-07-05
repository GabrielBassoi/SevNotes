import 'package:flutter/material.dart';
import 'package:sevnotes2/App/Settings/widgets/settings_app_bar.dart';
import 'package:sevnotes2/App/Settings/widgets/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: SettingsAppBar(context),
        body: SettingsBody(),
      ),
    );
  }
}
