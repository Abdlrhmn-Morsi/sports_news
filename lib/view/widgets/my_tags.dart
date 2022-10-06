// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_news/const/colors.dart';
import '../../controller/change index cubit/change_index_cubit.dart';
import '../../controller/change index cubit/change_index_state.dart';
import 'custom_text.dart';

class MyTags extends StatelessWidget {
  dynamic i;
  dynamic tagText;
  dynamic tagImgs;
  bool isTopTags;

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
            child: BlocBuilder<ChangeIndexCubit, ChangeIndexState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    ChangeIndexCubit.get(context).changeIndexTop(i);
                    // controller.currentIndexTagsTop.value = i;
                  },
                  child: Container(
                    width: i == 1
                        ? 105
                        : i == 4
                            ? 120
                            : 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: state.currentIndexTagsTop == i
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
                );
              },
            ),
          )
        : BlocBuilder<ChangeIndexCubit, ChangeIndexState>(
            builder: (context, state) {
              return Padding(
                padding: i == 0
                    ? const EdgeInsets.only(
                        left: 0, right: 8, top: 8, bottom: 8)
                    : const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    ChangeIndexCubit.get(context).changeIndexBottom(i);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: state.currentIndexTagsBottom == i
                            ? MyConst.darkBlue
                            : MyConst.liteBlue,
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
              );
            },
          );
  }
}
