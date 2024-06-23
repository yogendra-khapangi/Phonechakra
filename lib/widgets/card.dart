import 'package:flutter/material.dart';
import 'package:phonechakra/utils/colors.dart';

// ignore: must_be_immutable
class CardOne extends StatelessWidget {
  String? title;
  int? totalcities;
  int? totallisting;

  CardOne({
    super.key,
    @required this.title,
    required this.totalcities,
    required this.totallisting,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 99.0) {
        //>
        return Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Stack(children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.dashboard,
                      color: AppColor.ancentColor,
                    ),
                    // const SizedBox(height: 4),
                    Wrap(alignment: WrapAlignment.center, children: [
                      Text(
                        "$title",
                        style: const TextStyle(
                            height: 1,
                            fontSize: 12,
                            color: AppColor.secondaryColor),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow
                            .ellipsis, // Handles overflow with ellipsis
                        maxLines: 3,
                      ),
                    ]),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                color: AppColor.lightSecondaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    " $totalcities cities",
                    style: const TextStyle(
                        fontSize: 8, color: AppColor.secondaryColor),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: .1,
                child: Text(
                  " $totallisting Listings",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ]),
          ),
        );
      } else {
        return Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Stack(children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.dashboard,
                      color: AppColor.ancentColor,
                    ),
                    // const SizedBox(height: 4),
                    Wrap(alignment: WrapAlignment.center, children: [
                      Text(
                        "$title",
                        style: const TextStyle(
                            height: 1,
                            fontSize: 16,
                            color: AppColor.secondaryColor),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow
                            .ellipsis, // Handles overflow with ellipsis
                        maxLines: 3,
                      ),
                    ]),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                color: AppColor.lightSecondaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    " $totalcities cities",
                    style: const TextStyle(
                        fontSize: 12, color: AppColor.secondaryColor),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: .1,
                child:
                    // Text(
                    //   'Screen Width: ${constraints.maxWidth.toStringAsFixed(2)}, Screen Height: ${constraints.maxHeight.toStringAsFixed(2)}',
                    // )
                    Text(
                  " $totallisting Listings",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ]),
          ),
        );
      }
    });
  }
}
