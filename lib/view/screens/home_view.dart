import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soccer_news/controller/get_data.dart';

import 'package:soccer_news/view/widgets/custom_appbar.dart';
import 'package:soccer_news/view/widgets/custom_future_builder.dart';
import 'package:soccer_news/view/widgets/custom_tags_bottom.dart';
import 'package:soccer_news/view/widgets/custom_tags_top.dart';
import 'package:soccer_news/view/widgets/custom_text.dart';
import '../../const/colors.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  GetDataController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBlue,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 70),
          //my appbar
          const CustomAppBar(),
          const SizedBox(height: 5),
          const CustomTagsTop(),
          const SizedBox(height: 8),
          //trending & see all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(
                  text: 'Trending News',
                  fontSize: 22,
                ),
              ),
              CustomText(
                text: 'See All',
                color: Colors.blue,
              )
            ],
          ),
          const SizedBox(height: 8),
          // trending cards & tags & bottom cards
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //trending card
                  CustomFutureBuilder(
                    lang: 'en',
                    cntr: 'us',
                  ),
                  const SizedBox(height: 10),
                  const CustomTagsBottom(),
                  //bottom card
                  CustomFutureBuilder(
                    lang: 'ar',
                    cntr: 'eg',
                    isTrendingCard: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
