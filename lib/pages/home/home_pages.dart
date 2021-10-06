import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantshop/data/plants_data.dart';
import 'package:plantshop/utils/color.dart';
import 'package:plantshop/utils/text_style.dart';

import 'components/custom_appbar.dart';
import 'components/item_card.dart';
import 'components/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: Stack(
          children: [
            const CustomAppBar(),
            Row(
              children: [
                const Menu(),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 35.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Green'),
                        const Text(
                          'Plants',
                          style: headline1,
                        ),
                        Expanded(
                          child: Scrollbar(
                            thickness: 4,
                            child: ListView.builder(
                              itemCount: plants.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (itemBuilder, index) {
                                final plant = plants[index];
                                return ItemCard(
                                  plant: plant,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {},
                child: SvgPicture.asset(
                  'assets/icon/home.svg',
                  height: 25.0,
                  color: kwhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
