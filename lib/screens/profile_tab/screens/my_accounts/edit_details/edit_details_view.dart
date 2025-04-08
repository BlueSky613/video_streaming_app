import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/helper/helper.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/my_accounts/edit_details/edit_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

class EditDetailsView extends StatelessWidget {
  const EditDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
      bottomNavigationBar: bottomBar(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringConstant.accountDetails,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Padding(
      padding: horizontalPadding().copyWith(
          bottom: PrimeSizeConfig.displayHeight(context) *
              SizeConstant.opacity0point03),
      child: PrimeElevatedButton(
        onPressed: () => Get.back(),
        child: Text(
          StringConstant.submit,
          style: StyleConstants.button,
        ),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    EditDetailsController editDetailsController =
        Get.put(EditDetailsController());
    return Obx(
      () => ListView(
        shrinkWrap: true,
        padding: horizontalPadding(),
        children: [
          Text(
            StringConstant.name,
            style: StyleConstants.description2.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.fontColorOpacity60),
          ),
          PrimeTextField(
            hintText: StringConstant.enterYourMobileName,
            controller: editDetailsController.nameController,
          ),
          const SizedBox(height: SizeConstant.appSize48),
          Text(
            StringConstant.mobileNumber,
            style: StyleConstants.description2.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.fontColorOpacity60),
          ),
          PrimeTextField(
            focusNode: editDetailsController.mobileFocusNode,
            hintText: StringConstant.enterYourMobileNumber,
            controller: editDetailsController.mobileController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(SizeConstant.appSize10.toInt()),
              PhoneNumberFormatter(),
            ],
            prefix: GestureDetector(
              onTap: () => editDetailsCountryPickerDialog(context),
              child: Text("${editDetailsController.selectedCode.value}  ",
                  maxLines: SizeConstant.appSize1.toInt(),
                  overflow: TextOverflow.ellipsis,
                  style: StyleConstants.description2.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.fontColorOpacity100)),
            ),
          ),
          const SizedBox(height: SizeConstant.appSize48),
          Text(
            StringConstant.emailAddress,
            style: StyleConstants.description2.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.fontColorOpacity60),
          ),
          PrimeTextField(
            hintText: StringConstant.enterYourEmailAddress,
            controller: editDetailsController.emailController,
          ),
          const SizedBox(height: SizeConstant.appSize48),
          Text(
            StringConstant.gender,
            style: StyleConstants.description2.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.fontColorOpacity60),
          ),
          const SizedBox(height: SizeConstant.appSize12),
          Row(
            children:
                List.generate(editDetailsController.genderList.length, (i) {
              return Expanded(
                child: Obx(
                  () => GestureDetector(
                    onTap: () => editDetailsController
                        .onTapedGender(editDetailsController.genderList[i]),
                    child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(
                            horizontal: SizeConstant.appSize5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: SizeConstant.appSize18,
                            vertical: SizeConstant.appSize10),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SizeConstant.appSize10),
                            border: Border.all(
                                color: editDetailsController
                                            .selectedGender.value ==
                                        editDetailsController.genderList[i]
                                    ? ColorConstant.fontColorOpacity100
                                    : ColorConstant.fontColorOpacity60)),
                        duration: Duration(
                            milliseconds: SizeConstant.appSize400.toInt()),
                        alignment: Alignment.center,
                        child: Text(
                          editDetailsController.genderList[i],
                          style: StyleConstants.description2.copyWith(
                              fontWeight: FontWeight.w500,
                              color:
                                  editDetailsController.selectedGender.value ==
                                          editDetailsController.genderList[i]
                                      ? ColorConstant.fontColorOpacity100
                                      : ColorConstant.fontColorOpacity60),
                        )),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: SizeConstant.appSize48),
          Text.rich(TextSpan(
            text: StringConstant.enterTxt + StringConstant.dateOfBirth,
            style: StyleConstants.description2.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.fontColorOpacity60),
          )),
          PrimeTextField(
            hintText: StringConstant.dateOfBirth,
            controller: editDetailsController.dobController,
            readOnly: true,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => Container(
                  height: SizeConstant.appSize200,
                  decoration: const BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SizeConstant.appSize10),
                          topRight: Radius.circular(SizeConstant.appSize10))),
                  width: PrimeSizeConfig.displayWidth(context),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    backgroundColor: ColorConstant.fontColorOpacity60,
                    minimumDate: DateTime(1980, 01, 01),
                    minimumYear: 1980,
                    maximumYear: DateTime.now().year,
                    initialDateTime: editDetailsController.initialDate.value,
                    dateOrder: DatePickerDateOrder.dmy,
                    onDateTimeChanged: (date) {
                      editDetailsController.initialDate.value = date;
                      editDetailsController.dobController.text =
                          DateFormat("dd /MM /yyyy")
                              .format(editDetailsController.initialDate.value);
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: SizeConstant.appSize18)
        ],
      ),
    );
  }
}
