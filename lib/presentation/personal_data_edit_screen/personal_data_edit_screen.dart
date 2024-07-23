import 'package:english_academy_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_leading_image.dart';
import 'package:english_academy_mobile/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import '../../data/model/profileModel.dart';
import '../../service/profileService.dart';


class PersonalDataEditScreen extends StatefulWidget {
  PersonalDataEditScreen({Key? key})
      : super(
    key: key,
  );

  @override
  PersonalDataEditScreenState createState() => PersonalDataEditScreenState();
}
class PersonalDataEditScreenState extends State<PersonalDataEditScreen>
    with AutomaticKeepAliveClientMixin<PersonalDataEditScreen> {

  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  late Future<ProfileModel> _profileFuture;
  bool _isEditing = false;
  bool _isEditingPhone = false;
  bool _isEditingGender = false;

  @override
  void initState() {
    super.initState();
    _profileFuture = ProfileService.fetchProfileDetail();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppbar(context),
      body: FutureBuilder<ProfileModel>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final ProfileModel profile = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 48.v,
                ),
                child: Column(
                  children: [
                    _buildcode(context, profile),
                    _buildname(context, profile),
                    _buildemail(context, profile),
                    _buildbirthday(context, profile),
                    _buildgender(context, profile),
                    _buildphone(context, profile),
                    _buildaddress(context, profile),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context){
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 22.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Personal Detail",
      ),
    );
  }

  Widget _buildcode(BuildContext context, ProfileModel profile) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            height: 22.adaptSize,
            width: 22.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Student Code",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  profile.code,
                  style: CustomTextStyles.labelLargeBluegray500.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),

    );
  }
  Widget _buildname(BuildContext context, ProfileModel profile ) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            height: 22.adaptSize,
            width: 22.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  profile.fullName,
                  style: CustomTextStyles.labelLargeBluegray500.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),

    );
  }
  Widget _buildemail(BuildContext context, ProfileModel profile ) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            height: 22.adaptSize,
            width: 22.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  profile.email,
                  style: CustomTextStyles.labelLargeBluegray500.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),

    );
  }
  Widget _buildbirthday(BuildContext context, ProfileModel profile) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            height: 22.adaptSize,
            width: 22.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Birthday",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  profile.dayOfBirth.toString(),
                  style: CustomTextStyles.labelLargeBluegray500.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),

    );
  }

  Widget _buildgender(BuildContext context, ProfileModel profile) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: _isEditingGender
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: genderController.text.isNotEmpty ? genderController.text : null,
                  items: ['Female', 'Male', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      genderController.text = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isEditingGender = false;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 2, horizontal: 5)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(CustomTextStyles.labelMediumPrimary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(// Độ bo tròn của viền nút (nếu không sử dụng hằng số)
                          ),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 10.h),
                    TextButton(
                      onPressed: () {
                        _updategender(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 2, horizontal: 5)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(CustomTextStyles.labelMediumPrimary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gender",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  profile.gender,
                  style: CustomTextStyles.labelLargeBluegray500.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (!_isEditingGender)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditingGender = true;
                  genderController.text = profile.gender; // Set the initial value
                });
              },
            ),
        ],
      ),
    );
  }
  void _updategender(BuildContext context) async {
    final newGender = genderController.text;
    if (newGender.isNotEmpty) {
      try {
        await ProfileService.updategender(newGender, context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gender updated successfully')),
        );
        setState(() {
          _isEditingGender = false;
          _profileFuture = ProfileService.fetchProfileDetail(); // Refresh profile data
        });
      } catch (e) {
        print('Error updating gender: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating gender: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your gender')),
      );
    }
  }
  Widget _buildphone(BuildContext context, ProfileModel profile) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        children: [
          Expanded(
            child: _isEditingPhone
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isEditingPhone = false;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(CustomTextStyles.labelMediumPrimary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 10.h),
                    TextButton(
                      onPressed: () {
                        _updatePhoneNumber(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 2, horizontal: 5)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(CustomTextStyles.labelMediumPrimary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  profile.phone,
                  style: CustomTextStyles.labelLargeBluegray500.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (!_isEditingPhone)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditingPhone = true;
                });
              },
            ),
        ],
      ),
    );
  }
  void _updatePhoneNumber(BuildContext context) async {
    final newPhoneNumber = phoneController.text;
    if (newPhoneNumber.isNotEmpty) {
      try {
        await ProfileService.updatephoneNumber(newPhoneNumber, context);
        setState(() {
          _isEditingPhone = false;
        });
      } catch (e) {
        print('Error updating phone number: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your phone number')),
      );
    }
  }
  Widget _buildaddress(BuildContext context, ProfileModel profile) {
    print(profile.address);
    return Container(
      padding: EdgeInsets.only(
        top: 16.v,
        bottom: 15.v,
      ),
      decoration: AppDecoration.outlineBluegray502,
      child: Row(
        children: [
          Expanded(
            child: _isEditing
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = false;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 2, horizontal: 5)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(CustomTextStyles.labelMediumPrimary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 10.h),
                    TextButton(
                      onPressed: () {
                        _updateAddress(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 2, horizontal: 5)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(CustomTextStyles.labelMediumPrimary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address",
                  style: CustomTextStyles.bodySmallBluegray300_1.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  profile.address,
                  style: CustomTextStyles.labelLargeBluegray500.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (!_isEditing)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
        ],
      ),
    );
  }
  void _updateAddress(BuildContext context) async {
    final newAddress = addressController.text;
    if (newAddress.isNotEmpty) {
      try {
        await ProfileService.updateaddress(newAddress, context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Address updated successfully')),
        );
        setState(() {
          _isEditing = false;
        });
      } catch (e) {
        print('Error updating address: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating address: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your address')),
      );
    }
  }



  onTapArrowLeft (BuildContext context){
    Navigator.pop(context);
  }
}