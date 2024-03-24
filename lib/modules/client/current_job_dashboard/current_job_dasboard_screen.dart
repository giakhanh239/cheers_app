import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/modules/client/current_job_dashboard/controller/current_job_dashboard_controller.dart';
import 'package:freelance/modules/client/current_job_dashboard/controller/list_artist_item.dart';
import 'package:freelance/modules/client/job_dashboard/widget/job_item.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class CurrentJobDashboardScreen extends StatelessWidget {
  CurrentJobDashboardScreen({super.key});

  final _controller = Get.put(CurrentJobDashboardController());

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
          body: SafeArea(
            child: ListView(padding: EdgeInsets.all(20), children: [
              ..._buildListArtist(isTopTen: true),
              space(height: 20),
              ..._buildListArtist(label: "Film"),
              space(height: 20),
              ..._buildListArtist(label: "Music"),
              space(height: 20),
              ..._buildListArtist(label: "Art"),
              space(height: 20),
            ]),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildListArtist({bool? isTopTen, String? label}) {
    bool isTop10 = isTopTen == true;
    return [
      Text(
        label ?? "Trending",
        style: AppStyles.headline2Style,
      ),
      space(height: 20),
      isTop10 ? _buildBodyArtistViewTop10() : _buildBodyArtistView(label),
      space(height: 20),
      Obx(
        () => indicator(_controller.selectedPage.value),
      ),
    ];
  }

  Widget _buildBodyArtistView(String? label) {
    List<String> listImage = [];
    if (label == "Film") {
      listImage = listImageFilm;
    } else if (label == "Music") {
      listImage = listImageMusic;
    } else if (label == "Art") {
      listImage = listImageArtist;
    }
    return SizedBox(
      height: 100,
      child: PageView(
        controller: _controller.pageController,
        children: [
          ListArtistItem(listArtist: listImage,),
          ListArtistItem(),
          ListArtistItem(),
        ],
        onPageChanged: (page) {
          _controller.selectedPage.value = page;
        },
      ),
    );
  }

  List<String> listImageTop10 = [
    "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2019/9/6/753212/Son-Tung-Mtp.jpg",
    "https://mcdn.coolmate.me/image/October2021/do-mixi-1_73.jpg",
    "https://yt3.googleusercontent.com/ytc/AIdro_nEbazOp2pLH08gLKKvA1LklNGReRskUlfnUodhWQ=s900-c-k-c0x00ffffff-no-rj",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKotj_aZjFUYmcJY-4SoqK_YZd2eQ_mo9VT4oLVvrtQ&s",
    "https://nld.mediacdn.vn/291774122806476800/2023/11/29/monodep08-1701220098324152532295.jpg"
  ];

  List<String> listImageMusic = [
    "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2019/9/6/753212/Son-Tung-Mtp.jpg",
    "https://nld.mediacdn.vn/291774122806476800/2023/11/29/monodep08-1701220098324152532295.jpg",
    "https://media.viez.vn/prod/2023/5/1/IMG_0876_e6323e0717.PNG",
    "https://i.scdn.co/image/ab6761610000e5eb66e0a040a53996e8bf19f9b5",
    "https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2023/12/19/vu-17029508569171995513105.jpg"
  ];

  List<String> listImageFilm = [
    "https://yt3.googleusercontent.com/ytc/AIdro_nEbazOp2pLH08gLKKvA1LklNGReRskUlfnUodhWQ=s900-c-k-c0x00ffffff-no-rj",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUirk9rUXxUXHDxfcK1wdMbCJ5RkqDD2bLRhifVqZyXw&s",
    "https://thanhnien.mediacdn.vn/Uploaded/thynhm/2022_01_04/nguyen-quang-dung-5454.jpg",
    "https://thanhnien.mediacdn.vn/Uploaded/caotung/2021_10_29/le-hoang-4539.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD00d0SNLZC7OaPDh1-J3TcCa6aP6zQ2pMC7uhNGvR&s"
  ];

  List<String> listImageArtist = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKotj_aZjFUYmcJY-4SoqK_YZd2eQ_mo9VT4oLVvrtQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBBxMSmh-z3gPXum-N-3wjSjfBLBd2O_v_emts1Vxb&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5WbAGyDCaCDsxDhrMmtU5hNzzoX8r7zfj-0KrG8MW5A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL0ZgCJAkYV5zAnXjK77FA_D7j1xyzcOeziKvDSm3Cxg&s",
    "https://violin.edu.vn/profiles/sanpham/violin-edu-vn-nghe-si-dan-violin-noi-tieng-o-viet-nam.jpg"
  ];

  SizedBox _buildBodyArtistViewTop10() {
    return SizedBox(
      height: 100,
      child: Obx(
        () => Row(
          children: [
            _controller.selectedPage == 0
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      _controller.pageController
                          .jumpToPage(_controller.selectedPage.value - 1);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
            Expanded(
              child: PageView(
                controller: _controller.pageController,
                children: [
                  ListArtistItem(
                    listArtist: listImageTop10,
                  ),
                  ListArtistItem(),
                  ListArtistItem(
                    networkUrl: "",
                  ),
                ],
                onPageChanged: (page) {
                  _controller.selectedPage.value = page;
                },
              ),
            ),
            _controller.selectedPage.value == 2
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      _controller.pageController
                          .jumpToPage(_controller.selectedPage.value + 1);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
          ],
        ),
      ),
    );
  }

  Widget _buildJobItem(Job? job) {
    return Column(
      children: [
        JobItem(
          job: job,
        ),
        space(height: 20)
      ],
    );
  }
}
