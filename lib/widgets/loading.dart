import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:phonechakra/utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AnimatedLoadingHeartBeat(
      color: AppColor.ancentColor,
      speed: Duration(milliseconds: 600),
    );
  }
}
