import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/modal_bottom_sheet_scaffold.dart';
import '../../../../core/widgets/show_modal_bottom_sheet.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/widgets/country_code_widget.dart';
import '../cubit/update_mobile_send_code/update_mobile_send_code_cubit.dart';
import 'update_mobile_verify_dialog.dart';

class UpdateMobileDialog extends StatefulWidget {
  const UpdateMobileDialog({super.key});

  @override
  State<UpdateMobileDialog> createState() => _UpdateMobileDialogState();
}

class _UpdateMobileDialogState extends State<UpdateMobileDialog> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mobileNumberTextController = TextEditingController();
  final FocusNode mobileFocus = FocusNode();
  Country? selectedCountry;
  String? warningMessage;

  @override
  void initState() {
    super.initState();
    context.read<UpdateMobileSendCodeCubit>().emitInitState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetScaffold(
      title: Strings.editPhoneNumber,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Row(
              children: [
                CountryCodeWidget(
                  country: selectedCountry,
                  updateValue: (Country country) {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: AppTextFormField(
                    controller: mobileNumberTextController,
                    focusNode: mobileFocus,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    isPhone: true,
                    validatorType: ValidatorType.phone,
                    hintText: '${Strings.enterMobileNumber}...',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            warningMessage != null
                ? Text(warningMessage!, style: TextStyles.regular12(color: colors.errorColor))
                : const SizedBox(),
            SizedBox(height: 16.h),
            BlocConsumer<UpdateMobileSendCodeCubit, UpdateMobileSendCodeState>(
              listener: (context, state) {
                if(state is UpdateMobileSendCodeSuccessState){
                  Navigator.pop(context);
                  // showAppSnackBar(context: context, message: state.message, type: ToastType.success);
                  showAppModalBottomSheet(
                    context: context,
                    child: const UpdateMobileVerifyDialog(),
                  );
                }
                if(state is UpdateMobileSendCodeErrorState){
                  showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                }
              },
              builder: (context, state){
                if(state is UpdateMobileSendCodeLoadingState){
                  return Center(child: const CircularProgressIndicator().appLoading);
                }
                return Column(
                  children: [
                    Builder(
                      builder: (context){
                        if(state is UpdateMobileSendCodeErrorState){
                          return Column(
                            children: [
                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: TextStyles.regular14(color: Colors.red),
                              ),
                              SizedBox(height: 8.h),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    AppElevatedButton(
                      onPressed: () => onButtonPressed(context),
                      text: Strings.confirm,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  onButtonPressed(BuildContext context) async {
    if (formKey.currentState!.validate() && selectedCountry != null) {
      formKey.currentState!.save();
      try{
        await Constants.phoneParsing(
          phone: mobileNumberTextController.text.trim(),
          countryCode: selectedCountry?.countryCode,
        ).then((String? phoneParsed) {
          if(phoneParsed == null){
            setState(() {
              warningMessage = Strings.errorValidPhoneNumber;
            });
            return;
          }
          context.read<UpdateMobileSendCodeCubit>().fUpdateMobileSendCode(
            mobile: phoneParsed,
            callingCode: selectedCountry!.phoneCode,
          );
        });
      }on PlatformException catch(e){
        setState(() {
          warningMessage = e.message?? '';
        });
      }
    } else {
      setState(() {
        warningMessage = Strings.pleaseChooseCountry;
      });
    }
  }
}
