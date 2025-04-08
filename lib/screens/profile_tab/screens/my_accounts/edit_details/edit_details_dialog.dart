import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/my_accounts/edit_details/edit_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

Future editDetailsCountryPickerDialog(BuildContext context) async {
  EditDetailsController editDetailsController =
      Get.put(EditDetailsController());
  return await showModalBottomSheet(
      isScrollControlled: false,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConstant.selectCountry,
                  style: StyleConstants.heading20Size,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    AssetsConstant.closeIcon,
                    scale: SizeConstant.appSize4,
                  ),
                )
              ],
            ),
            SizedBox(
                height: PrimeSizeConfig.displayHeight(context) *
                    SizeConstant.opacity0point01),
            PrimeTextField(
              prefix: Image.asset(AssetsConstant.searchIcon,
                  scale: SizeConstant.appSize4),
              hintText: StringConstant.searchCountry,
              isRounded: true,
              fillColor: ColorConstant.whiteColor,
              filled: true,
            ),
            SizedBox(
                height: PrimeSizeConfig.displayHeight(context) *
                    SizeConstant.opacity0point01),
            Expanded(
                child: ListView(
              children: List.generate(
                countries.length,
                (index) {
                  var item = countries[index];
                  return ListTile(
                    dense: true,
                    onTap: () => editDetailsController.dialogSelectCodePressed(
                        item[StringConstant.code].toString()),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(item[StringConstant.flag].toString()),
                    ),
                    title: Text(item[StringConstant.namePicker].toString(),
                        style: StyleConstants.description2.copyWith(
                            color: ColorConstant.fontColorOpacity100)),
                    subtitle: Text(item[StringConstant.code].toString(),
                        style: StyleConstants.description2.copyWith(
                            color: ColorConstant.fontColorOpacity100)),
                  );
                },
              ),
            ))
          ],
        ).paddingOnly(
            top: SizeConstant.appSize10,
            left: SizeConstant.appSize16,
            right: SizeConstant.appSize16);
      });
}
