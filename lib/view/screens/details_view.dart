import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:soccer_news/const/colors.dart';
import 'package:soccer_news/view/widgets/custom_text.dart';
import '../widgets/custom_tags_top.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  dynamic img;
  dynamic title;
  dynamic description;
  dynamic i;
  DetailsView({
    Key? key,
    required this.img,
    required this.title,
    required this.i,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBlue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: CustomIcon(
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 25,
              ),
            ),
            actions: [
              CustomIcon(
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FaIcon(FontAwesomeIcons.heart),
                ),
              )
            ],
            pinned: false,
            backgroundColor: MyColors.darkBlue,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: i,
                child: Image.network(
                  img,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTagsTop(),
                  const SizedBox(height: 10),
                  //title
                  SizedBox(
                      width: 300,
                      child: CustomText(
                        text: title,
                        isMax: false,
                      )),
                  const SizedBox(height: 10),
                  // category & time created
                  Row(
                    children: [
                      CustomText(
                        text: 'sports',
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(width: 6),
                      CustomText(
                        text: '5 hours ago',
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //content
                  CustomText(
                    text: description,
                    isMax: false,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  dynamic icon;
  CustomIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: MyColors.darkBlue,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
      ),
    );
  }
}
