import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ads/BannerAds.dart';
import 'ads/InterstitialAds.dart';
import 'ads/RewardedAds.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Show"),
        backgroundColor: Colors.blue,centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height:80,),
            ElevatedButton(onPressed:(){
              context.read<InterstitialAdsCubit>().showAd();
            }
                ,style:ElevatedButton.styleFrom(backgroundColor: Colors.green) , child:Text("InterstitialAds Ads",style: TextStyle(color: Colors.black),)),
            SizedBox(height: 50,),
            ElevatedButton(onPressed:(){
            context.read<RewardedAdsCubit>().showAd();
            },
                style:ElevatedButton.styleFrom(backgroundColor: Colors.red) , child:Text("Rewarded Ads",style: TextStyle(color: Colors.white))),
            Spacer(),
            BannerAddView()
          ],
        ),
      ),
    );
  }
}
