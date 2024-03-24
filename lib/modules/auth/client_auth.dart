import 'package:flutter/material.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/ultility.dart';

class ClientAuth extends StatelessWidget {
  const ClientAuth({super.key, required this.onConnect});
  final Function onConnect;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          space(height: 10),
          Text("Connect the wallet of Buyer",style: AppStyles.regular,),
          space(height: 10),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [AppColors.mainColor, AppColors.secondaryColor])),
            child: ElevatedButton(
              onPressed: () {
                onConnect.call();
              },
              child: Text(
                "Connect",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(0, 40),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
            ),
          )
        ],
      ),
    );
  }
}
