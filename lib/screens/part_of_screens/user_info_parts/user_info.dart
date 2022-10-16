import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/list_tile_widget.dart';
import '../../../widget/text_title_widget.dart';

class UserInfoWidgetScreen extends StatelessWidget {
  const UserInfoWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextTitleWidget(
              titleText: "User Information",
            ),
          ),
        ),
        Divider(
          thickness: 1,
        ),
        ListTileWidget(
          title: "Email",
          subTitle: "sub",
          icon: CupertinoIcons.mail,
        ),
        ListTileWidget(
          title: "Phone Number",
          subTitle: "sub",
          icon: CupertinoIcons.phone,
        ),
        ListTileWidget(
          title: "Address",
          subTitle: "sub",
          icon: CupertinoIcons.location,
        ),
        ListTileWidget(
          title: "Joined Date",
          subTitle: "sub",
          icon: Icons.date_range,
        ),

      ],
    );
  }
}
