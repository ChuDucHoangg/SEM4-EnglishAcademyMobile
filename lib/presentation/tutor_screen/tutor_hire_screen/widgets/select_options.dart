import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import '../../../../data/model/TurtorModel.dart';
import '../../../../service/TutorService.dart';
import '../../../../theme/app_decoration.dart';

class SelectOptions extends StatefulWidget {
  final TutorModel tutor;
  final ValueChanged<PackageTutorModel?> onPackageSelected;

  const SelectOptions(
      {Key? key, required this.tutor, required this.onPackageSelected})
      : super(key: key);

  @override
  _SelectOptionsState createState() => _SelectOptionsState();
}

class _SelectOptionsState extends State<SelectOptions> {
  PackageTutorModel? _selectedPackage;
  List<PackageTutorModel> _packages = [];

  final List<String> _listDropdown = [
    'Package',
    'Week',
  ];

  String _selectedDropdownValue = 'Package';

  String truncateText(String text) {
    if (text.length > 40) {
      return text.substring(0, 40) + '...';
    } else {
      return text;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPackages();
  }

  Future<void> _fetchPackages() async {
    try {
      final packages = await TutorService.fetchPackageTutor(widget.tutor.code);
      setState(() {
        _packages = packages;
      });
    } catch (e) {
      print('Error checking course student: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Select Options',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                decoration: AppDecoration.outlineOnErrorContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: CustomDropdown<String>(
                  hintText: 'Select',
                  items: _listDropdown,
                  initialItem: _listDropdown[0],
                  onChanged: (value) {
                    setState(() {
                      _selectedDropdownValue = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        // if (_selectedPackage != null)
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text('Selected Package: ${_selectedPackage!.name}'),
        //   ),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          child: Visibility(
            visible: _selectedDropdownValue == 'Package',
            child: SizedBox(
              height: 160.h,
              child: CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 24 / 9,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false),
                items: _packages.map((package) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPackage = package;
                      });
                      widget.onPackageSelected(package);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1E2857),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5B6C8C),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    package.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 300,
                                child: MSHCheckbox(
                                  size: 25,
                                  value: _selectedPackage == package,
                                  colorConfig: MSHColorConfig
                                      .fromCheckedUncheckedDisabled(
                                    checkedColor: Color(0xFF5B6C8C),
                                  ),
                                  style: MSHCheckboxStyle.fillScaleCheck,
                                  onChanged: (selected) {
                                    setState(() {
                                      _selectedPackage =
                                          selected ? package : null;
                                      widget.onPackageSelected(
                                          selected ? package : null);
                                    });
                                  },
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 10,
                                child: Text(
                                  '\$${package.hourlyRate.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 75,
                                left: 10,
                                child: Text(
                                  truncateText(package.description),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Number Session: ${package.numSessions}',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              Text("                 "),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'MN24H',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
