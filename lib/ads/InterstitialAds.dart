
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdsCubit extends Cubit<InterstitialAd?>{
   InterstitialAdsCubit():super(null){
    loadInterstitialAd();
   }
   void loadInterstitialAd(){
     InterstitialAd.load(
         adUnitId: "ca-app-pub-3940256099942544/1033173712",
         request: AdRequest(),
         adLoadCallback: InterstitialAdLoadCallback(
             onAdLoaded:(ad)=>emit(ad),
             onAdFailedToLoad:(error)=>emit(null)
         )
     );
   }
   void showAd(){
     final ad=state;
     if(ad != null){
       ad.fullScreenContentCallback=FullScreenContentCallback(
         onAdDismissedFullScreenContent: (ad){
           loadInterstitialAd();
         },
         onAdFailedToShowFullScreenContent: (ad,error){
           ad.dispose();
           loadInterstitialAd();
       }
       );
       ad.show();
       emit(null);
     }else{
       print("fail to run");
     }
   }
   @override
  Future<void> close(){
     state?.dispose();
     return super.close();
   }
}