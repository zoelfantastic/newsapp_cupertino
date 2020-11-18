import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_cuppertino/widgets/platform_widget.dart';

class SettingsPage extends StatelessWidget {
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Settings'),
        ),
        child: _buildList(context));
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text('Dark Theme'),
            trailing: Switch.adaptive(
                value: false,
                onChanged: (value) {
                  defaultTargetPlatform == TargetPlatform.iOS
                      ? showCupertinoDialog(
                          context: null,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('coming soon'),
                              content:
                                  Text('This feature will be coming soon!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          })
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Coming Soon'),
                              content: Text('This feature will be coming soon'),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok'))
                              ],
                            );
                          });
                }),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
