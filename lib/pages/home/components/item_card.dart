import 'package:flutter/material.dart';
import 'package:plantshop/data/plants_data.dart';
import 'package:plantshop/pages/detail/detail_page.dart';
import 'package:plantshop/utils/color.dart';
import 'package:plantshop/utils/space.dart';
import 'package:plantshop/utils/text_style.dart';

class ItemCard extends StatelessWidget {
  final Plant plant;
  const ItemCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => DetailPage(plant: plant)));
      },
      child: Container(
        height: 400.0,
        margin:const EdgeInsets.only(right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              plant.images[0],
              height: 250.0,
            ),
            const SpaceVH(height: 20.0),
            Text(
              plant.name,
              style: headline2,
            ),
            const SpaceVH(height: 5.0),
            Text(
              plant.description,
              maxLines: 2,
            ),
            const SpaceVH(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.price,
                  style: headline2,
                ),
               const SpaceVH(width: 20.0),
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    color: kwhite,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: kblack.withOpacity(0.3),
                        blurRadius: 10.0,
                        offset:const Offset(1, 6),
                      ),
                    ],
                  ),
                  child:const Icon(
                    Icons.add,
                    size: 10.0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}