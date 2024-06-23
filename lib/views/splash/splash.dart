import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/utils/routes.dart';
import 'package:phonechakra/widgets/loading.dart';
import 'package:phonechakra/widgets/logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  checkAuth() {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(AppRoute.home);
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(width: 200),
            SizedBox(
              height: 2,
            ),
            LoadingWidget()
          ],
        ),
      ),
    ));
  }
}
