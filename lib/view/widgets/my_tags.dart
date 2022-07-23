// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soccer_news/const/colors.dart';

import '../../controller/get_data.dart';
import 'custom_text.dart';

class MyTags extends StatelessWidget {
  dynamic i;
  dynamic tagText;
  dynamic tagImgs;
  bool isTopTags;
  GetDataController controller = Get.find();

  MyTags({
    Key? key,
    required this.i,
    this.isTopTags = true,
    this.tagText,
    this.tagImgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isTopTags
        ? Padding(
            padding: i == 0
                ? const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8)
                : const EdgeInsets.all(8),
            child: GetX<GetDataController>(
              builder: (controller) => GestureDetector(
                onTap: () {
                  controller.currentIndexTagsTop.value = i;
                },
                child: Container(
                  width: i == 1
                      ? 105
                      : i == 4
                          ? 120
                          : 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: controller.currentIndexTagsTop.value == i
                        ? const Color.fromARGB(255, 0, 10, 24)
                        : const Color.fromARGB(255, 1, 31, 77),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color.fromARGB(255, 1, 31, 77),
                      width: 2,
                    ),
                  ),
                  child: CustomText(text: tagText[i]),
                ),
              ),
            ),
          )
        : Padding(
            padding: i == 0
                ? const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8)
                : const EdgeInsets.all(8),
            child: GetX<GetDataController>(
              builder: (controller) => GestureDetector(
                onTap: () {
                  controller.currentIndexTagsBottom.value = i;
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.currentIndexTagsBottom.value == i
                          ? MyColors.darkBlue
                          : MyColors.liteBlue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 1, 31, 77),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        tagImgs[i],
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          );
  }
}
