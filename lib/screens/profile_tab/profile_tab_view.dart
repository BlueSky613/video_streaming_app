import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/profile_tab.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/edit_profile/edit_profile.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

import 'screens/my_accounts/my_acounts.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: horizontalPadding(),
        child: Text(
          StringConstant.profileTxt,
          style: StyleConstants.heading20Size,
        ),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    ProfileTabController profileTabController = Get.put(ProfileTabController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (item, result) {
        BottomBarController bottomBarController =
            Get.put(BottomBarController());
        bottomBarController.selectedIndex.value = SizeConstant.appSize0.toInt();
        bottomBarController.pageController!
            .jumpToPage(SizeConstant.appSize0.toInt());
      },
      child: Padding(
        padding: horizontalPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderProfileWidget(),
            const SizedBox(height: SizeConstant.appSize10),
            const Divider(),
            const SizedBox(height: SizeConstant.appSize10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    var item = profileTabController.profileList[index];
                    return ListTile(
                      onTap: () {
                        if (index != SizeConstant.appSize6.toInt()) {
                          Get.to(() => item.page!);
                        } else {
                          signOutDialog(context);
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      minTileHeight: SizeConstant.appSize44,
                      leading: Image.asset(
                        item.icon,
                        scale: SizeConstant.opacity4point5,
                      ),
                      title: Text(
                        item.name,
                        style: StyleConstants.description1.copyWith(
                            color: ColorConstant.fontColorOpacity100,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(SizeConstant.appSize5),
                        child: Divider(),
                      ),
                  itemCount: profileTabController.profileList.length),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: SizeConstant.appSize106,
      duration: Duration(milliseconds: SizeConstant.appSize400.toInt()),
      padding: const EdgeInsets.all(SizeConstant.appSize16),
      decoration: BoxDecoration(
          color: ColorConstant.bottomBarBgColor,
          borderRadius: BorderRadius.circular(SizeConstant.appSize14)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Hero(
            tag: StringConstant.appTitle,
            child: CircleAvatar(
              maxRadius: SizeConstant.appSize35,
              minRadius: SizeConstant.appSize35,
              backgroundColor: ColorConstant.backgroundColor,
              backgroundImage: AssetImage(AssetsConstant.userProfileImg),
            ),
          ),
          const SizedBox(width: SizeConstant.appSize10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringConstant.userName,
                  style: StyleConstants.description1,
                  maxLines: SizeConstant.appSize1.toInt(),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  StringConstant.userPhoneNumber,
                  maxLines: SizeConstant.appSize1.toInt(),
                  overflow: TextOverflow.ellipsis,
                  style: StyleConstants.commonStyle.copyWith(
                      color: ColorConstant.fontColorOpacity60,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => const EditProfileView()),
            child: Row(
              children: [
                Image.asset(
                  AssetsConstant.editIcon,
                  scale: SizeConstant.appSize4,
                ),
                const SizedBox(
                  width: SizeConstant.appSize10,
                ),
                Text(StringConstant.editTxt,
                    style: StyleConstants.description2.copyWith(
                      color: ColorConstant.editTextColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
