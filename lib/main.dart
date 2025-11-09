import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads/BannerAds.dart';
import 'ads/InterstitialAds.dart';
import 'ads/RewardedAds.dart';
import 'homePage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(MultiBlocProvider(providers:[
    BlocProvider(create: (context)=>InterstitialAdsCubit()),
    BlocProvider(create:(context)=>RewardedAdsCubit()),
    BlocProvider(create: (context)=>BannerAdCubit())
  ], child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  )));
}
