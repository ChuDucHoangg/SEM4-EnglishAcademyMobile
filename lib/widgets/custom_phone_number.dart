import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:country_pickers/country.dart';
import 'package:english_academy_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    required this.country,
    required this.onTap,
    required this.controller,
  }) : super(
    key: key,
  );

  Country country;

  Function(Country) onTap;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          12.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _openCountryPicker(context);
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                top: 22.v,
                bottom: 22.v,
              ),
              child: Row(
                children: [
                  CountryPickerUtils.getDefaultFlagImage(
                    country,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowDownGray90001,
                    height: 6.v,
                    margin: EdgeInsets.only(
                      left: 10.h,
                      top: 6.v,
                      bottom: 4.v,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 17.h,
                right: 5.h,
              ),
              child: CustomTextFormField(
                width: 272.h,
                controller: controller,
                hintText: "7248481225",
                textInputType: TextInputType.phone,
                contentPadding: EdgeInsets.symmetric(horizontal: 5.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      Container(
        margin: EdgeInsets.only(
          left: 10.h,
        ),
        width: 60.h,
        child: Text(
          "+${country.phoneCode}",
          style: TextStyle(fontSize: 14.fSize),
        ),
      ),
      const SizedBox(width: 8.0),
      Flexible(
        child: Text(
          country.name,
          style: TextStyle(fontSize: 14.fSize),
        ),
      ),
    ],
  );
  void _openCountryPicker(BuildContext context) => showDialog(
    context: context,
    builder: (context) => CountryPickerDialog(
      searchInputDecoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: TextStyle(fontSize: 14.fSize),
      ),
      isSearchable: true,
      title: Text('Select your phone code',
          style: TextStyle(fontSize: 14.fSize)),
      onValuePicked: (Country country) => onTap(country),
      itemBuilder: _buildDialogItem,
    ),
  );
}
