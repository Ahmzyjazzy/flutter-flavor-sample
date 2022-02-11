import 'package:flutter/material.dart';
import 'package:flavor_test/config/device_info_dialog.dart';
import 'package:flavor_test/config/flavor_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  late BannerConfig bannerConfig;

  FlavorBanner({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;

    bannerConfig = _getDefaultBanner();

    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.name,
        bannerColor: FlavorConfig.instance.color);
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
            message: bannerConfig.bannerName,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor,
          ),
        ),
      ),
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DeviceInfoDialog();
          },
        );
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({required this.bannerName, required this.bannerColor});
}
