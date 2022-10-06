import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soccer_news/view/screens/home_view.dart';

import 'controller/change index cubit/change_index_cubit.dart';
import 'controller/soccer cubit/soccer_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SoccerCubit>(
            create: (context) => SoccerCubit()
              ..getSoccerArData
              ..getSoccerEnData,
          ),
          BlocProvider<ChangeIndexCubit>(
            create: (context) => ChangeIndexCubit(),
          )
        ],
        child: HomeView(),
      ),
    );
  }
}
