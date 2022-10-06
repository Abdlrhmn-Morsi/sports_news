import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_news/controller/soccer%20cubit/soccer_cubit.dart';
import 'package:soccer_news/view/widgets/custom_appbar.dart';
import 'package:soccer_news/view/widgets/custom_bottom_card.dart';
import 'package:soccer_news/view/widgets/custom_tags_bottom.dart';
import 'package:soccer_news/view/widgets/custom_tags_top.dart';
import 'package:soccer_news/view/widgets/custom_text.dart';
import '../../const/colors.dart';
import '../widgets/custom_trending_card.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    SoccerCubit.get(context)
      ..getSoccerArData()
      ..getSoccerEnData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConst.darkBlue,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
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
              child: RefreshIndicator(
                  onRefresh: () async {},
                  child: SingleChildScrollView(
                      child: BlocBuilder<SoccerCubit, SoccerState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          //trending card

                          SoccerCubit.get(context).isLoadingTop
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomTrendingCard(
                                  soccer: SoccerCubit.get(context).newsEnList),

                          const CustomTagsBottom(),
                          //bottom card
                          SoccerCubit.get(context).isLoadingBottom
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomBottomCard(
                                  soccer: SoccerCubit.get(context).newsArList),
                        ],
                      );
                    },
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
