import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '/config/routes/app_routes.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/app_elevated_button.dart';
import '/core/widgets/custom_app_bar.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/tags_text_form_field.dart';
import '/injection_container.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController locationController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final FocusNode phoneFocus = FocusNode();

  final FocusNode locationFocus = FocusNode();
  final FocusNode userNameFocus = FocusNode();
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  Position? _currentPosition;
  Position? position;
  bool _locationPermissionGranted = false;
  LatLng? pickedLocation;
  String? address;
  String? initialAddress;
  Marker? _selectedLocationMarker;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _selectedLocationMarker = Marker(
        markerId: const MarkerId('selected_location'),
        position: position,
      );
    });
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        _locationPermissionGranted = true;
      });
      _getCurrentLocation();
    } else {
      setState(() {
        _locationPermissionGranted = false;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
        //pickedLocation =LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              txt: 'إضافة عنوان جديد',
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اسم الموقع *',
                    style: TextStyles.bold16(color: colors.textColor),
                  ),
                  Gaps.vGap12,
                  AppTextFormField(
                      backgroundColor: colors.backGround,
                      controller: locationController,
                      focusNode: locationFocus,
                      hintText: ''),
                  Gaps.vGap20,
                  Text(
                    'اسم المستخدم *',
                    style: TextStyles.bold16(color: colors.textColor),
                  ),
                  Gaps.vGap12,
                  AppTextFormField(
                      backgroundColor: colors.backGround,
                      controller: userNameController,
                      focusNode: userNameFocus,
                      hintText: ''),
                  Gaps.vGap20,
                  Text(
                    'رقم الجوال *',
                    style: TextStyles.bold16(color: colors.textColor),
                  ),
                  Gaps.vGap12,
                  AppTextFormField(
                      backgroundColor: colors.backGround,
                      controller: phoneController,
                      focusNode: phoneFocus,
                      hintText: ''),
                  Gaps.vGap20,
                  Text(
                    'العنوان',
                    style: TextStyles.bold16(color: colors.textColor),
                  ),
                  Gaps.vGap12,
                  _locationPermissionGranted
                      ? (_currentPosition != null
                          ? SizedBox(
                              height: 241.h,
                              child: Stack(
                                children: [
                                  GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(_currentPosition!.latitude,
                                          _currentPosition!.longitude),
                                      zoom: 15.0,
                                    ),
                                    // myLocationEnabled: true,
                                    // myLocationButtonEnabled: true,
                                    mapToolbarEnabled: true,
                                    zoomControlsEnabled: false,
                                    onTap: _onMapTapped,
                                    markers: _selectedLocationMarker != null
                                        ? {_selectedLocationMarker!}
                                        : {},
                                    // onCameraMove: (position) {
                                    //   if(pickedLocation !=position.target){
                                    //     setState(() {
                                    //       pickedLocation=position.target;
                                    //       print(pickedLocation!.longitude.toString());
                                    //     });
                                    //   }
                                    // },
                                  ),
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: SvgPicture.asset(SvgAssets.address),
                                  // ),
                                ],
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: colors.main,
                              ),
                            ))
                      : const Center(
                          child: Text(
                            'Location permission denied. Please grant permission to use this feature.',
                          ),
                        ),
                  Gaps.vGap20,
                  AppElevatedButton(
                      text: 'حفظ',
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.paymentScreenRoute);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller = controller;
    });
  }
}
