import 'package:flutter/material.dart';
import 'my_tags.dart';

class CustomTagsBottom extends StatelessWidget {
  const CustomTagsBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tagImgs = [
      'lib/assets/images/p-l-logo.png',
      'lib/assets/images/cup.png',
      'lib/assets/images/champion -boll.png',
      'lib/assets/images/liverpool-fc.png',
      'lib/assets/images/realmadrid-fc.png',
      'lib/assets/images/player.png',
    ];

    return SizedBox(
      width:  MediaQuery.of(context).size.width,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagImgs.length,
        itemBuilder: (context, i) {
          return Padding(
            padding:  i == 0 ? const EdgeInsets.only(left: 5) : const EdgeInsets.only(left: 0),
            child: MyTags(
              
              tagImgs: tagImgs,
              i: i,
              isTopTags: false,
            ),
          );
        },
      ),
    );
  }
}
