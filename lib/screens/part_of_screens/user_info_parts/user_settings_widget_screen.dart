 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import '../../../provider/dark_theme_provider.dart';
import '../../../widget/list_tile_widget.dart';
import '../../../widget/text_title_widget.dart';
class UserSettingsWidgetScreen extends StatefulWidget {
    UserSettingsWidgetScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsWidgetScreen> createState() => _UserSettingsWidgetScreenState();
}

class _UserSettingsWidgetScreenState extends State<UserSettingsWidgetScreen> {

  @override
  Widget build(BuildContext context) {
    var themeChange =Provider.of<DarkThemeProvider>(context);
    return Column(
      children:  [
        const  Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextTitleWidget(
              titleText: "User Settings",
            ),
          ),
        ),
        const  Divider(
          thickness: 1,
        ),
        ListTileSwitch(
          value: themeChange.darkTheme,
          leading: IconButton(
            onPressed: (){},
              icon: const Icon(CupertinoIcons.moon)),
          onChanged: (value) {
            setState(() {
              themeChange.darkTheme = value;
            });
          },
          visualDensity: VisualDensity.comfortable,
          switchType: SwitchType.cupertino,
          switchActiveColor: Colors.purple,
          title: const Text('Theme Mode'),
        ),
        const ListTileWidget(
          title: "Log Out",
          subTitle: "sub",
          icon: Icons.logout,
        ),

      ],
    );
  }
}
