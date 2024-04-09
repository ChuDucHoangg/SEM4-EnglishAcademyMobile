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
    return Row(
      children: [
        InkWell(
          onTap: () {
            _openCountryPicker(context);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: appTheme.blueGray50,
                  width: 1.h,
                ),
                left: BorderSide(
                  color: appTheme.blueGray50,
                  width: 1.h,
                ),
                bottom: BorderSide(
                  color: appTheme.blueGray50,
                  width: 1.h,
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 18.v,
                    bottom: 18.v,
                  ),
                  child: CountryPickerUtils.getDefaultFlagImage(
                    country,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.h, 18.v, 17.h, 17.v),
                  child: Text(
                    "+${country.phoneCode}",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 5.h),
            child: CustomTextFormField(
              width: 243.h,
              controller: controller,
              hintText: "8976 88",
              suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 22.v, 15.h, 22.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: 56.v,
              ),
              contentPadding: EdgeInsets.only(
                left: 16.h,
                top: 18.v,
                bottom: 18.v,
              ),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryLR12,
            ),
          ),
        ),
      ],
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
