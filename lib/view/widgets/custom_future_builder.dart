// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:soccer_news/view/widgets/custom_text.dart';

import '../../controller/get_data.dart';
import '../../model/soccer_model.dart';
import 'custom_bottom_card.dart';
import 'custom_trending_card.dart';

// ignore: must_be_immutable
class CustomFutureBuilder extends StatelessWidget {
  GetDataController controller = Get.find();
  dynamic lang;
  dynamic cntr;
  bool isTrendingCard;

  CustomFutureBuilder({
    Key? key,
    required this.lang,
    required this.cntr,
    this.isTrendingCard = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Soccer>>(
      future: controller.fetchData(lang, cntr),
      builder: (ctx, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == null) {
          return Center(
            child: CustomText(
              text: 'NULL',
            ),
          );
        }
        List<Soccer> soccer = snapshot.data;
        return isTrendingCard
            ? CustomTrendingCard(soccer: soccer)
            : CustomBottomCard(soccer: soccer);
      },
    );
  }
}
