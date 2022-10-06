import 'package:flutter/material.dart';
import 'package:soccer_news/const/colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text(
            'Sport News',
            style: GoogleFonts.bebasNeue(
              fontSize: 30,
              color: Colors.blue.shade100,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: MyConst.blue,
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
