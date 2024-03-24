import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/main_app_bar.dart';
import 'package:freelance/modules/client/job_dashboard/widget/job_item.dart';
import 'package:freelance/modules/client/profile_screen/widget/item_project.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/ultility.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KolProfileScreen extends StatefulWidget {
  const KolProfileScreen({super.key});

  @override
  State<KolProfileScreen> createState() => _KolProfileScreenState();
}

class _KolProfileScreenState extends State<KolProfileScreen> {
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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: MainAppBar().build(context),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
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
      ],
    );
  }
  Padding _buildBody() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Raising:",style: AppStyles.headline3Style,),
          space(height: 10),
          JobItem(),
          space(height: 10),
          indicator(0),
          Text("Ended",style: AppStyles.headline3Style,),
          space(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.mainColor),),
            child: ListView(children: [
              JobItem(isEnded: true,name: "Project A",percent: 100,),
              space(height: 10),
              JobItem(isEnded: true,name: "Project S",percent: 100,),
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
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.mainColor),
          ),
          child: Stack(
            children: [Align(alignment: Alignment.bottomRight
                ,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppElevatedButton(label: "Follow"),
                ))],
          ),
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
                  "Total Raise:",style: AppStyles.headline2Style,
                ),
                space(height: 10),
                Text("\$100.000.000",style: AppStyles.timeStyle,),
                space(height: 10),
                Text("Total Reward:",style: AppStyles.headline2Style,),
                space(height: 10),
                Text("\$2.000.000",style: AppStyles.timeStyle,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
