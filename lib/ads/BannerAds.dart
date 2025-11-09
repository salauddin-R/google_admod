

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdCubit extends Cubit<BannerAd?>{

  BannerAdCubit():super(null){
    loadBannerAd();
  }

  // Loads an interstitial ad
  void loadBannerAd() {
    final BannerAd bannerAd= BannerAd(
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        size:AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad)=>emit(ad as BannerAd),
          onAdFailedToLoad: (ad,error) {
            emit(null);
          },
        )

    );
    bannerAd.load();
  }


  @override
  Future<void> close() {
    state?.dispose(); // Dispose the ad properly
    return super.close();
  }
}


class BannerAddView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerAdCubit,BannerAd?>(
        builder: (context,bannerAd){
          return bannerAd == null?SizedBox():Container(
            alignment: Alignment.center,
            child: AdWidget(ad: bannerAd),
            width: bannerAd.size.width.toDouble(),
            height: bannerAd.size.height.toDouble(),
          );
        }
    );
  }

}