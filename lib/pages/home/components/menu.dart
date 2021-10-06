import 'package:flutter/material.dart';
import 'package:plantshop/data/menu_data.dart';
import 'package:plantshop/utils/color.dart';
import 'package:plantshop/utils/text_style.dart';

import 'clipper.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.0,
      color: kgreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < menuItems.length; i++)
            menuButton(
              text: menuItems[i].name,
              onTap: () {
                setState(() {
                  selectIndex = i;
                });
              },
              index: i,
            ),
        ],
      ),
    );
  }

  Widget menuButton({
    required String text,
    required int index,
    required Function() onTap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: TextButton(
              onPressed: onTap,
              child: Text(
                text,
                style: buttonText,
              ),
            ),
          ),
        ),
        selectIndex == index
            ? RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: CustomMenuClip(),
                  child: Container(
                    width: 35,
                    height: 110,
                    color: kwhite,
                    child: const Center(
                      child: CircleAvatar(
                        backgroundColor: kgreen,
                        radius: 3,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(
                width: 35,
                height: 110,
              ),
      ],
    );
  }
}
