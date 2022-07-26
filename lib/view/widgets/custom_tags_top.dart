import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_tags.dart';

// ignore: must_be_immutable
class CustomTagsTop extends StatefulWidget {
  const CustomTagsTop({Key? key}) : super(key: key);

  @override
  State<CustomTagsTop> createState() => _CustomTagsState();
}

class _CustomTagsState extends State<CustomTagsTop> {
  List tagText = ['Live', 'EURO 2023', 'uk', 'final', 'primer leage'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  MediaQuery.of(context).size.width,
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagText.length,
        itemBuilder: (context, i) {
          return Padding(
            padding:
                i == 0 ? const EdgeInsets.only(left: 5) : const EdgeInsets.only(left: 0),
            child: MyTags(
              tagText: tagText,
              i: i,
            ),
          );
        },
      ),
    );
  }
}
