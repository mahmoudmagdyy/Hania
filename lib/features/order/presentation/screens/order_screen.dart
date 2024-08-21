import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hania/core/widgets/my_default_button.dart';
import 'package:hania/core/widgets/text_form_field.dart';
import 'package:permission_handler/permission_handler.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  //final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController codeController = TextEditingController();
  final FocusNode codeFocus = FocusNode();
  final TextEditingController visitDateController = TextEditingController();
  final FocusNode visitDateFocus = FocusNode();
  final TextEditingController carePeriodController = TextEditingController();
  final FocusNode carePeriodFocus = FocusNode();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionFocus = FocusNode();

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
      appBar: AppBar(
        title: Text('service_request'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _locationPermissionGranted
                  ? (_currentPosition != null
                      ? SizedBox(
                          height: 180.h,
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
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: colors.secondaryColor,
                  ),
                  Text(
                    'السعودية',
                    style: TextStyles.regular18(color: colors.secondaryColor),
                  )
                ],
              ),
              Gaps.vGap16,
              Text(
                'visiting_code'.tr,
                style: TextStyles.regular16(),
              ),
              AppTextFormField(
                controller: codeController,
                focusNode: codeFocus,
                hintText: '',
              ),
              Gaps.vGap16,
              Text(
                'requested_service'.tr,
                style: TextStyles.regular16(),
              ),
              DropdownButtonFormField(
                hint: Padding(
                  padding: EdgeInsets.only(right: 12.r),
                  child: Text(
                    'city'.tr,
                    style:
                    TextStyles.bold14(color: Colors.grey),
                  ),
                ),
                items:[
                  DropdownMenuItem(
                      value: 1,
                      child: Padding(
                        padding:
                        EdgeInsets.only(right: 12.r),
                        child: Text(
                          'category.name!',
                          style: TextStyles.bold14(),
                        ),
                      )
                    // label: category.name!,
                  ),DropdownMenuItem(
                      value: 1,
                      child: Padding(
                        padding:
                        EdgeInsets.only(right: 12.r),
                        child: Text(
                          'category.name!',
                          style: TextStyles.bold14(),
                        ),
                      )
                    // label: category.name!,
                  ),
                ],
                onChanged: (d) {
                },
                decoration: const InputDecoration(
                    border: InputBorder.none),
              ),
              Divider(color: colors.dividerColor,thickness: 1,),
              // AppTextFormField(
              //   controller: codeController,
              //   focusNode: codeFocus,
              //   hintText: '',
              // ),
              Gaps.vGap16,
              Text(
                'visit_date'.tr,
                style: TextStyles.regular16(),
              ),
              AppTextFormField(
                controller: visitDateController,
                focusNode: visitDateFocus,
                hintText: '',
                suffixIcon: Icon(Icons.calendar_month_outlined,color: colors.textColor,),
                readOnly: true,
              ),
              Gaps.vGap16,
              Text(
                'care_period'.tr,
                style: TextStyles.regular16(),
              ),
              AppTextFormField(
                controller: carePeriodController,
                focusNode: carePeriodFocus,
                hintText: '',
              ),
              Gaps.vGap16,
              Text(
                'description_of_the_medical_condition'.tr,
                style: TextStyles.regular16(),
              ),
              AppTextFormField(
                controller: descriptionController,
                focusNode: descriptionFocus,
                hintText: '',
                maxLines: 5,
              ),
              Gaps.vGap100,
              MyDefaultButton(onPressed: (){},btnText: 'send',),
              Gaps.vGap50,
            ],
          ),
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
