import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soccer_news/const/colors.dart';
import 'package:soccer_news/view/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.search, color: Colors.white, size: 30),
          CustomText(text: 'Soccer News', fontSize: 25),
          Container(
            alignment: Alignment.center,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: MyColors.blue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue.shade900, width: 2)),
            child: Image.asset(
              'lib/assets/images/user.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
