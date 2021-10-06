import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantshop/data/plants_data.dart';
import 'package:plantshop/utils/color.dart';
import 'package:plantshop/utils/space.dart';
import 'package:plantshop/utils/text_style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.plant}) : super(key: key);
  final Plant plant;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectImage = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kblack,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: kblack,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            color: kgreen,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height / 1.5,
              decoration: const BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 30.0,
              width: 30.0,
              margin: const EdgeInsets.only(right: 10.0, top: 20.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kgreen,
              ),
              child: const Icon(
                Icons.favorite_border_outlined,
                color: kwhite,
                size: 18.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: height / 2.2,
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        selectImage = index;
                      });
                    },
                    children: [
                      for (int i = 0; i < widget.plant.images.length; i++)
                        Image.asset(
                          widget.plant.images[i],
                          height: height / 2.2,
                        )
                    ],
                  ),
                ),
                const SpaceVH(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.0,
                      child: Column(
                        children: [
                          for (int k = 0; k < widget.plant.images.length; k++)
                            Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              height: k == selectImage ? 20.0 : 6.0,
                              width: 6,
                              decoration: BoxDecoration(
                                color: k == selectImage
                                    ? kgreen
                                    : kgreen.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.plant.name,
                            style: headline1,
                          ),
                          const SpaceVH(height: 5.0),
                          Text(
                            widget.plant.description,
                            maxLines: 2,
                          ),
                          const SpaceVH(height: 20.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.plant.price,
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
                                      offset: const Offset(1, 6),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 10,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 120.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomTag(
                    headingText: 'Height',
                    image: 'height.svg',
                    text: widget.plant.height,
                  ),
                  bottomTag(
                    headingText: 'Temperature',
                    image: 'celsius.svg',
                    text: widget.plant.temp,
                  ),
                  bottomTag(
                    headingText: 'Pot',
                    image: 'plant-pot.svg',
                    text: widget.plant.pot,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomTag({
    required String text,
    required String image,
    required String headingText,
  }) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icon/$image',
          height: 30.0,
          color: kwhite,
        ),
        const SpaceVH(height: 15.0),
        Text(
          headingText,
          style: headline3,
        ),
        const SpaceVH(height: 5.0),
        Text(
          text,
          style: headline4,
        ),
      ],
    );
  }
}
