
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdsCubit extends Cubit<RewardedAd?>{
  RewardedAdsCubit():super(null){
    loadRewardedAd();
  }
  void loadRewardedAd(){
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: AdRequest(),
        rewardedAdLoadCallback:RewardedAdLoadCallback(
          onAdLoaded: (ad) => emit(ad),
          onAdFailedToLoad: (error) {
            emit(null);
          },
        )
    );
  }
  void showAd(){
    final ad=state;
    if(ad != null){
      ad.fullScreenContentCallback=FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad){
            loadRewardedAd();
          },
          onAdFailedToShowFullScreenContent: (ad,error){
            ad.dispose();
            loadRewardedAd();
          }
      );
      ad.show(
        onUserEarnedReward: (ad,eward){

        }
      );
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