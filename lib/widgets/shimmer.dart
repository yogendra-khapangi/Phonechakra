import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmereffetForpopular extends StatelessWidget {
  const ShimmereffetForpopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GridView.builder(
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  height: 50,
                  width: 50,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ShimmereffetForRecentListing extends StatelessWidget {
  const ShimmereffetForRecentListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width * .5,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 30,
                            width: MediaQuery.of(context).size.width * .3,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * .3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
