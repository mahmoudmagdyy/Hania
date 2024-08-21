import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/config/routes/app_routes.dart';
import 'package:hania/core/utils/values/assets.dart';
import 'package:hania/core/widgets/my_default_button.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../core/widgets/register_back_dialog.dart';
import '../../../../core/widgets/show_dialog.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';
import '../../../portal/domain/entities/get_cities_response.dart';
import '../../../portal/domain/entities/get_doctor_titles_response.dart';
import '../../../portal/domain/entities/get_governments_response.dart';
import '../../../portal/domain/entities/get_specialities_response.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController firstNameTextController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final TextEditingController dateOfBirthTextController =
      TextEditingController();
  final FocusNode dateOfBirthFocus = FocusNode();
  final TextEditingController nationalIDTextController =
      TextEditingController();
  final FocusNode nationalIDFocus = FocusNode();
  final TextEditingController contractingpartyController =
      TextEditingController();
  final FocusNode contractingpartyFocus = FocusNode();
  final TextEditingController statusdescriptionController =
      TextEditingController();
  final FocusNode statusdescriptionFocus = FocusNode();

  int currentStep = 1;
  String cityName = 'Egyption';
  String dateStr = '';
  Country? selectedCountry;
  Government? selectedGovernment;
  City? selectedCity;
  Speciality? speciality;
  Speciality? subSpeciality;
  DoctorTitle? doctorTitle;

  @override
  void initState() {
    //context.read<RegisterCubit>().resetFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        await showAppDialog(
              context: context,
              child: const RegisterBackDialog(),
            ) ??
            false;
      },
      child: GestureDetector(
        onTap: () => unFocus(),
        child: Scaffold(
          backgroundColor: colors.upBackGround,
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'create_account'.tr,
              style: TextStyles.bold18(),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    Gaps.vGap25,
                    Image.asset(Assets.selectImageProfileImage),
                    Gaps.vGap35,
                    AppTextFormField(
                      controller: firstNameTextController,
                      focusNode: firstNameFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      borderColor: colors.baseColor,
                      validatorType: ValidatorType.textOnly,
                      hintText: 'name'.tr,
                    ),
                    Divider(
                      thickness: 2.h,
                      color: colors.dividerColor,
                    ),
                    Gaps.vGap35,
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: colors.dividerColor),
                        ),
                        color: colors.baseColor,
                      ),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: colors.baseColor),
                        child: ExpansionTile(
                          title: Text('nationality'.tr),
                        ),
                      ),
                    ),
                    Gaps.vGap35,
                    AppTextFormField(
                      controller: dateOfBirthTextController,
                      focusNode: dateOfBirthFocus,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      borderColor: colors.baseColor,
                      // validatorType: ValidatorType.,
                      hintText: 'DateOfBirth'.tr,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await getDate(controller: dateOfBirthTextController);
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ),
                    Divider(
                      thickness: 2.h,
                      color: colors.dividerColor,
                    ),
                    Gaps.vGap35,
                    AppTextFormField(
                      controller: contractingpartyController,
                      focusNode: contractingpartyFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      borderColor: colors.baseColor,
                      validatorType: ValidatorType.textOnly,
                      hintText: 'contracting_party'.tr,
                    ),
                    Divider(
                      thickness: 2.h,
                      color: colors.dividerColor,
                    ),
                    Gaps.vGap35,
                    AppTextFormField(
                      controller: statusdescriptionController,
                      focusNode: statusdescriptionFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      borderColor: colors.baseColor,
                      validatorType: ValidatorType.textOnly,
                      hintText: 'status_description'.tr,
                      maxLines: 4,
                    ),
                    Divider(
                      thickness: 2.h,
                      color: colors.dividerColor,
                    ),
                    Gaps.vGap50,
                    LinearProgressIndicator(
                      value: 1 / 2,
                      valueColor: AlwaysStoppedAnimation<Color>(colors.main),
                      backgroundColor: colors.buttonColor2,
                    ),
                    Gaps.vGap20,
                    MyDefaultButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pushNamed(
                              context, Routes.secondRegisterRoute);
                        }
                      },
                      btnText: 'next',
                      width: 310.w,
                    ),
                    Gaps.vGap40,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  unFocus() {
    firstNameFocus.unfocus();
    dateOfBirthFocus.unfocus();
    nationalIDFocus.unfocus();
    contractingpartyFocus.unfocus();
    statusdescriptionFocus.unfocus();
  }

  getDate({required TextEditingController controller}) async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    String formatedDate = DateFormat('yyyy-MM-dd').format(date!);
    setState(() {
      controller.text = formatedDate;
    });
  }
}
