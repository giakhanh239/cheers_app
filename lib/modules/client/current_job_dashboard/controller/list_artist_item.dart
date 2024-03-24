import 'package:flutter/material.dart';
import 'package:freelance/routes/routes.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListArtistItem extends StatelessWidget {
  ListArtistItem({super.key, this.networkUrl, this.listArtist});

  final String? networkUrl;

  List<String>? listArtist = [];

  @override
  Widget build(BuildContext context) {
    final width = 60.0;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listArtist
                ?.map((e) => InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.kolProfileScreen);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          width: width,
                          height: width,
                          e ?? "",
                          alignment: Alignment.center,
                        ),
                      ),
                    ))
                .toList() ??
            []);
  }
}
