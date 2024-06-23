
import 'package:flutter/material.dart';

import '../utils/strings.dart';

class Logo extends StatelessWidget {
  final double width;
  const Logo({
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppString.logo,
      width: width,
    );
  }
}
