import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_hire_screen/widgets/information_tutor.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_hire_screen/widgets/select_day_and_time.dart';
import 'package:english_academy_mobile/presentation/tutor_screen/tutor_hire_screen/widgets/select_options.dart';
import 'package:english_academy_mobile/widgets/custom_elevated_button.dart';
import '../../../core/utils/image_constant.dart';
import '../../../data/model/TurtorModel.dart';
import '../../../service/TutorService.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class TutorHireScreen extends StatefulWidget {
  final TutorModel tutor;

  const TutorHireScreen({Key? key, required this.tutor}) : super(key: key);

  @override
  _TutorHireScreenState createState() => _TutorHireScreenState();
}

class _TutorHireScreenState extends State<TutorHireScreen>
    with SingleTickerProviderStateMixin {
  PackageTutorModel? _selectedPackage;
  Map<String, List<String>> _selectedSchedule = {};
  List<int> _selectedScheduleIds = [];

  void _onPackageSelected(PackageTutorModel? package) {
    setState(() {
      _selectedPackage = package;
    });
    if (package != null) {
      print('Selected Package ID: ${package.id}');
    }
  }

  void _onScheduleSelected(Map<String, List<String>> schedule, List<int> ids) {
    setState(() {
      _selectedSchedule = schedule;
      _selectedScheduleIds = ids;
      print('Selected Schedule IDs: $_selectedScheduleIds');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 46,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeftGray900,
          margin: EdgeInsets.only(left: 22),
          onTap: () {
            onTapArrowLeft(context);
          },
        ),
        actions: [
          AppbarTrailingImage(
            imagePath: ImageConstant.imgShareTwo,
            margin: EdgeInsets.symmetric(horizontal: 24),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InformationTutor(tutor: widget.tutor),
          SelectOptions(
            tutor: widget.tutor,
            onPackageSelected: _onPackageSelected,
          ),
          SelectDayAndTime(
            tutor: widget.tutor,
            onScheduleSelected: _onScheduleSelected,
          ),
          Spacer(),
          Center(
            child: CustomElevatedButton(
              width: 220.h,
              text: "Confirm",
              margin: EdgeInsets.only(bottom: 18.v),
              buttonStyle: CustomButtonStyles.fillPrimary,
              onPressed: () async {
                if (_selectedSchedule.isEmpty ||
                    _selectedSchedule.values.every((list) => list.isEmpty)) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    text: 'You must choose a class schedule in advance!',
                    confirmBtnColor: Color(0XFF1E2857),
                    borderRadius: 25.0,
                    width: 320,
                  );
                } else {
                  QuickAlert.show(
                      title: 'Confirm Information',
                      context: context,
                      type: QuickAlertType.confirm,
                      confirmBtnColor: Color(0XFF1E2857),
                      borderRadius: 25.0,
                      widget: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 4.v,
                            ),
                            decoration: AppDecoration.fillGray5002.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildItem(
                                  context,
                                  label: "Option type",
                                  value: _selectedPackage != null
                                      ? "Package"
                                      : "Week",
                                ),
                                _selectedPackage != null
                                    ? Column(
                                        children: [
                                          _buildItem(
                                            context,
                                            label: "Package",
                                            value:
                                                "${_selectedPackage!.hourlyRate}\$ / ${_selectedPackage!.numSessions} Day",
                                          ),
                                        ],
                                      )
                                    : Container(),
                                SizedBox(height: 6.v)
                              ],
                            ),
                          ),
                          SizedBox(height: 12.v),
                          Column(
                            children: _selectedSchedule.entries
                                .expand((entry) => entry.value.map(
                                      (time) => _buildItem(
                                        context,
                                        label: entry.key,
                                        value: time,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                      onConfirmBtnTap: () async {
                        Navigator.pop(context);
                        await Future.delayed(Duration(milliseconds: 500));

                        try {
                          await TutorService.createBookingTutor(
                            _selectedPackage == null ? 2 : 1,
                            widget.tutor.id,
                            _selectedPackage?.id ?? 0,
                            _selectedScheduleIds,
                          );
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: "Successfully",
                            text: "Request sent successfully!",
                            confirmBtnColor: Color(0XFF1E2857),
                            borderRadius: 25.0,
                            width: 320,
                          );
                        } catch (e) {
                          print("Failed to send data: $e");
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: 'An error occurred, please try again!',
                            confirmBtnColor: Color(0XFF1E2857),
                            borderRadius: 25.0,
                            width: 320,
                          );
                        }
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Common widget
Widget _buildItem(
  BuildContext context, {
  required String label,
  required String value,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12.v),
    decoration: AppDecoration.outlineBluegray502,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.gray60001,
          ),
        ),
        Text(
          value,
          style: CustomTextStyles.bodySmallGray900.copyWith(
            color: appTheme.gray900,
          ),
        )
      ],
    ),
  );
}

onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
}
