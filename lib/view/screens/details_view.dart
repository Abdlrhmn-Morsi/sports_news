import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soccer_news/const/colors.dart';
import 'package:soccer_news/view/widgets/custom_text.dart';
import '../../controller/change index cubit/change_index_cubit.dart';
import '../widgets/custom_tags_top.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  dynamic img;
  dynamic title;
  dynamic description;
  dynamic i;
  DetailsView({
    Key? key,
    required this.img,
    required this.title,
    required this.i,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConst.darkBlue,
      body: BlocProvider<ChangeIndexCubit>(
        create: (context) => ChangeIndexCubit(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: CustomIcon(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 25,
                ),
              ),
              actions: [
                CustomIcon(
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.heart),
                  ),
                )
              ],
              pinned: false,
              backgroundColor: MyConst.darkBlue,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: i,
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) => ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'lib/assets/images/default.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: ((context, url) => ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'lib/assets/images/default.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    imageUrl: img.toString(),
                    imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTagsTop(),

                    const SizedBox(height: 10),
                    //title
                    SizedBox(
                        width: 300,
                        child: CustomText(
                          text: title,
                          isMax: false,
                        )),
                    const SizedBox(height: 10),
                    // category & time created
                    Row(
                      children: [
                        CustomText(
                          text: 'sports',
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(width: 6),
                        CustomText(
                          text: '5 hours ago',
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //content
                    CustomText(
                      text: description,
                      isMax: false,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  dynamic icon;
  CustomIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
        Navigator.maybePop(context);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: MyConst.darkBlue,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
      ),
    );
  }
}
