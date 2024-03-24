import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:freelance/modules/client/profile_screen/widget/item_project.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/ultility.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppImages.imgBackground,
              fit: BoxFit.fill,
            )),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        _buildBannerAndBalance(),
                        _buildAvatarAndSocial(),
                      ],
                    ),
                  ),
                  _buildBody()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildBody() {
    return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Following:",style: AppStyles.headline2Style,),
                      space(width: 10),
                      CircleAvatar(),
                      space(width: 10),
                      CircleAvatar()
                    ],
                  ),
                  space(height: 20),
                  Text("Project",style: AppStyles.headline2Style,),
                  space(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.mainColor),),
                    child: ListView(children: [
                      ItemProject(),
                      space(height: 10),
                      ItemProject(),
                    ],),
                  ),
                ],
              ),
            );
  }

  Positioned _buildAvatarAndSocial() {
    return Positioned(
        top: 100,
        left: 20,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: 90,
                height: 90,
                child: CircleAvatar(),
              ),
            ),
            space(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  width: 40,
                  AppImages.icCompany,
                  alignment: Alignment.center,
                ),
                SvgPicture.asset(
                  width: 40,
                  AppImages.icCompany,
                  alignment: Alignment.center,
                ),
                SvgPicture.asset(
                  width: 40,
                  AppImages.icCompany,
                  alignment: Alignment.center,
                ),
              ],
            )
          ],
        ));
  }

  Column _buildBannerAndBalance() {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.mainColor)),
        ),
        space(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Invest:",style: AppStyles.regular,
                ),
                space(height: 10),
                Text("\$100.000",style: AppStyles.timeStyle,),
                space(height: 10),
                Text("Total Reward:",style: AppStyles.regular,),
                space(height: 10),
                Text("\$50.000",style: AppStyles.timeStyle,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
