import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/my_accounts/my_acounts.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/screens.dart';

class ProfileTabController extends GetxController {
  List<TabBarModel> profileList = [
    TabBarModel(
        icon: AssetsConstant.downloadIcon,
        name: StringConstant.myDownload,
        page: const MyDownloadView()),
    TabBarModel(
        icon: AssetsConstant.userDeIcon,
        name: StringConstant.myAccount,
        page: const MyAccountsView()),
    TabBarModel(
        icon: AssetsConstant.settingIcon,
        name: StringConstant.settingsAndPreferences,
        page: const SettingsPrefView()),
    TabBarModel(
        icon: AssetsConstant.diaryIcon,
        name: StringConstant.termsOfUse,
        page: const TermsOfUseView()),
    TabBarModel(
        icon: AssetsConstant.shieldIcon,
        name: StringConstant.privacyPolicyTxt,
        page: const PrivacyPolicyView()),
    TabBarModel(
        icon: AssetsConstant.questionIcon,
        name: StringConstant.helpAndFaqs,
        page: const HelpAndFaqView()),
    TabBarModel(
        icon: AssetsConstant.signOutIcon,
        name: StringConstant.signOut,
        page: Container()),
  ];
}
