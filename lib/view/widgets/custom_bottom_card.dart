import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soccer_news/model/soccer_model.dart';
import '../../const/colors.dart';
import '../screens/details_view.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomBottomCard extends StatelessWidget {
  List<Soccer> soccer;
  CustomBottomCard({
    Key? key,
    required this.soccer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: soccer.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () => Get.to(
            () => DetailsView(
              img: soccer[i].imageUrl.toString(),
              title: soccer[i].title.toString(),
              i: soccer[i],
              description: soccer[i].description.toString(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //img
                Hero(
                  tag: soccer[i],
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.liteBlue,
                          width: 3,
                        ),
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
                const SizedBox(width: 10),
                //title & content
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: MyColors.blue,
                      border: Border.all(
                        color: MyColors.liteBlue,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          CustomText(
                            text: soccer[i].title == null
                                ? 'no title'
                                : soccer[i].title.toString(),
                            fontSize: 12,
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            color: Colors.blue.shade200,
                            text: soccer[i].description == null
                                ? 'no content'
                                : soccer[i].description.toString(),
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
