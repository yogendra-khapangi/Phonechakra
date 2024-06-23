import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:phonechakra/controller/searchs.dart';

// ignore: must_be_immutable
class Aboutusview extends StatelessWidget {
  Aboutusview({super.key});
  var aboutuscontroller = Get.find<SearchsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About Us"),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  aboutuscontroller.aboutus.value.data!.image == null
                      ? const SizedBox()
                      : SizedBox(
                          height: 200,
                          width: Get.size.width,
                          child: Image.network(
                            "${aboutuscontroller.aboutus.value.data!.image}",
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )),
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: HtmlWidget(
                          "${aboutuscontroller.aboutus.value.data!.description}"),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
