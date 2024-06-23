// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:phonechakra/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class RecentCard extends StatelessWidget {
  final String name;
  final String image;
  final String type;
  final String category;
  final String address;
  final String email;
  final String phone;
  final String about;

  const RecentCard({
    super.key,
    required this.name,
    required this.image,
    required this.type,
    required this.category,
    required this.address,
    required this.email,
    required this.phone,
    required this.about,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 70,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              image,
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
                child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              width: 5,
            ),
            type == ""
                ? const SizedBox()
                : const Icon(
                    Icons.check_circle,
                    size: 12,
                    color: AppColor.ancentColor,
                  ),
            Text(
              type,
              style: const TextStyle(fontSize: 12, color: AppColor.ancentColor),
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            Text(
              address,
              style: const TextStyle(fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: MaterialButton(
                      elevation: 0,
                      color: AppColor.lightSecondaryColor,
                      textColor: AppColor.secondaryColor,
                      onPressed: () {
                        Get.bottomSheet(
                          backgroundColor: Colors.white,
                          SizedBox(
                            // height: MediaQuery.of(context).size.height * .30,
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(image),
                                  ),
                                  //
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Text(
                                        name,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                      type == ""
                                          ? const SizedBox()
                                          : const Icon(
                                              Icons.check_circle,
                                              color: AppColor.secondaryColor,
                                              size: 16,
                                            ),
                                      Text(
                                        type,
                                        style: const TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.dashboard,
                                        color: AppColor.secondaryColor,
                                        size: 16,
                                      ),
                                      Text(
                                        category,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.place,
                                        color: AppColor.secondaryColor,
                                        size: 16,
                                      ),
                                      Text(
                                        address,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  email != ""
                                      ? GestureDetector(
                                          onTap: () async {
                                            Uri uri = Uri.parse(
                                              'mailto:$email?subject=For Enquery..&body= ',
                                            );
                                            if (!await launcher
                                                .launchUrl(uri)) {
                                              debugPrint(
                                                  "Could not launch the uri"); // because the simulator doesn't has the email app
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.email,
                                                color: AppColor.secondaryColor,
                                                size: 16,
                                              ),
                                              Text(
                                                email,
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final Uri url =
                                          Uri(scheme: 'tel', path: phone);

                                      await launcher.launchUrl(url);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                          color: AppColor.secondaryColor,
                                          size: 16,
                                        ),
                                        Text(
                                          phone,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      about == ""
                                          ? const SizedBox()
                                          : const Icon(
                                              Icons.info,
                                              color: AppColor.secondaryColor,
                                              size: 16,
                                            ),
                                      Expanded(
                                        child: Text(
                                          about,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "More",
                        style: TextStyle(color: AppColor.secondaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: MaterialButton(
                      elevation: 0,
                      color: AppColor.secondaryColor,
                      onPressed: () async {
                        final Uri url = Uri(scheme: 'tel', path: phone);

                        await launcher.launchUrl(url);
                      },
                      child: const Text(
                        "Call",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
