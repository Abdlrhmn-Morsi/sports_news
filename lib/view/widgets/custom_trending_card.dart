import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsView(
                        img: soccer[i].imageUrl.toString(),
                        title: soccer[i].title.toString(),
                        i: soccer[i],
                        description: soccer[i].description.toString(),
                      ),
                    ),
                  )),
              child: Container(
                width: MediaQuery.of(context).size.width - 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyConst.liteBlue,
                    width: 2,
                  ),
                  color: MyConst.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    //img
                    Hero(
                      tag: soccer[i],
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) => ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: SizedBox(
                            width:  MediaQuery.of(context).size.width,
                            height: 180,
                            child: Image.asset(
                              'lib/assets/images/default.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: ((context, url) => ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: SizedBox(
                                width:  MediaQuery.of(context).size.width,
                                height: 180,
                                child: Image.asset(
                                  'lib/assets/images/default.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                        imageUrl: soccer[i].imageUrl.toString(),
                        imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Container(
                            width:  MediaQuery.of(context).size.width,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
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
                            fontSize: 14,
                          ),
                          const SizedBox(height: 10),
                          //content
                          CustomText(
                            color: Colors.blue.shade200,
                            text: soccer[i].description.toString(),
                            fontSize: 12,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //category & time created
                              Row(
                                children: [
                                  CustomText(
                                    fontSize: 10,
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
                                      color: Colors.grey.shade500, size: 18),
                                  const SizedBox(width: 8),
                                  FaIcon(FontAwesomeIcons.comment,
                                      color: Colors.grey.shade500, size: 18),
                                  const SizedBox(width: 8),
                                  FaIcon(FontAwesomeIcons.shareNodes,
                                      color: Colors.grey.shade500, size: 18),
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
