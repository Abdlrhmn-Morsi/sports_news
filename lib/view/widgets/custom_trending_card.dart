import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:soccer_news/const/colors.dart';
import 'package:soccer_news/model/soccer_model.dart';
import '../screens/details_view.dart';
import 'custom_text.dart';

class CustomTrendingCard extends StatelessWidget {
  List<Soccer> soccer;
  CustomTrendingCard({
    Key? key,
    required this.soccer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: soccer.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (() => Get.to(
                    () => DetailsView(
                      img: soccer[i].imageUrl.toString(),
                      title: soccer[i].title.toString(),
                      i: soccer[i],
                      description: soccer[i].description.toString(),
                    ),
                  )),
              child: Container(
                width: Get.width - 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.liteBlue,
                    width: 2,
                  ),
                  color: MyColors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    //img
                    Hero(
                      tag: soccer[i],
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Container(
                          width: Get.width,
                          height: 180,
                          decoration: BoxDecoration(
                            image: soccer[i].imageUrl == null
                                ? const DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/images/default.png',
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: NetworkImage(
                                      soccer[i].imageUrl.toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    // body
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Column(
                        children: [
                          //title
                          CustomText(
                            text: soccer[i].title.toString(),
                            fontSize: 15,
                          ),
                          const SizedBox(height: 10),
                          //content
                          CustomText(
                            color: Colors.blue.shade200,
                            text: soccer[i].description.toString(),
                            fontSize: 12,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //category & time created
                              Row(
                                children: [
                                  CustomText(
                                    fontSize: 13,
                                    text: 'sports',
                                  ),
                                  const SizedBox(width: 5),
                                  CustomText(
                                    text: '5 hours ago',
                                    fontSize: 10,
                                    color: Colors.grey.shade500,
                                  ),
                                ],
                              ),
                              // social icons
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.heart,
                                      color: Colors.grey.shade500, size: 20),
                                  const SizedBox(width: 8),
                                  FaIcon(FontAwesomeIcons.comment,
                                      color: Colors.grey.shade500, size: 20),
                                  const SizedBox(width: 8),
                                  FaIcon(FontAwesomeIcons.shareNodes,
                                      color: Colors.grey.shade500, size: 20),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
