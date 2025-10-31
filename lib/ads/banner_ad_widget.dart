import 'package:flappy_bird_app/ads/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBanner();
  }

  void _loadBanner() {
    // Add delay to ensure AdMob is fully initialized
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint('✅ Banner ad loaded successfully!');
            if (mounted) {
              setState(() {
                _isLoaded = true;
              });
            }
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('❌ Banner ad failed to load: $error');
            debugPrint(
                'Error code: ${error.code}, domain: ${error.domain}, message: ${error.message}');
            ad.dispose();
            if (mounted) {
              setState(() {
                _isLoaded = false;
                _bannerAd = null;
              });
            }
            // Retry after 5 seconds
            Future.delayed(const Duration(seconds: 5), () {
              if (mounted) _loadBanner();
            });
          },
          onAdOpened: (ad) {
            debugPrint('📱 Banner ad opened');
          },
          onAdClosed: (ad) {
            debugPrint('❎ Banner ad closed');
          },
        ),
        request: const AdRequest(),
      )..load();
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded && _bannerAd != null) {
      return SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return const SizedBox.shrink();
  }
}
