import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hania/core/utils/constants.dart';
import 'package:hania/core/utils/svg_manager.dart';
import 'package:hania/core/utils/values/assets.dart';
import 'package:hania/core/widgets/app_elevated_button.dart';
import 'package:hania/core/widgets/text_form_field.dart';

import '../../../../bill/presentation/screen/bill_screen.dart';
import '/config/locale/app_localizations.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';
import '../../widgets/profile_widget/profile_item_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController changeEmailController = TextEditingController();
  final FocusNode changeEmailFocus = FocusNode();
  final TextEditingController currentPasswordController = TextEditingController();
  final FocusNode currentPasswordFocus = FocusNode();
  final TextEditingController newPasswordController = TextEditingController();
  final FocusNode newPasswordFocus = FocusNode();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode confirmPasswordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'list'.tr,),
      ),
      body: SingleChildScrollView(
        physics:const ClampingScrollPhysics() ,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGap16,
              _buildProfileContainer(txt:'بياناتى'),
              Gaps.vGap20,
              ProfileItemWidget(
                itemImage:SvgAssets.profileIcon ,
                itemName:'الملف الشخصى' ,
                showArrow: true,
                onTap: (){

                },isSvg: true,
              ),
              ProfileItemWidget(
                itemImage:SvgAssets.invoiceIcon ,
                itemName:'الفواتير' ,
                showArrow: true,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BillScreen()));
                },isSvg: true,
              ),
              Gaps.vGap16,
              _buildProfileContainer(txt:'الاعدادات'),
              Gaps.vGap16,
              ProfileItemWidget(
                itemImage:SvgAssets.changeEmailIcon ,
                itemName:'تغير البريد الالكترونى' ,
                showArrow: true,
                onTap: (){
                  Constants.buildCustomShowModel(context: context, child: Container(
                    padding: EdgeInsets.all(16.r),
                    height: 275.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight:Radius.circular(30) ,topLeft: Radius.circular(30))
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(SvgAssets.changeEmailIcon),
                            Gaps.hGap12,
                            Text('البريد الالكترونى',style: TextStyles.bold18(),)
                          ],
                        ),
                        Gaps.vGap8,
                        AppTextFormField(controller: changeEmailController, focusNode: changeEmailFocus, hintText: 'info@hania.com'),
                        Gaps.vGap32,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: AppElevatedButton(buttonRadius: 50.r,text: 'تحديث', onPressed: (){}),
                        )
                      ],
                    ),
                  ));
                  // showBottomSheet(context: context,
                  //     builder: (context) {
                  //       return Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.only(topRight:Radius.circular(30) ,topLeft: Radius.circular(30))
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 SvgPicture.asset(Assets.changeEmail),
                  //                 Text('البريد الالكترونى',style: TextStyles.bold18(),)
                  //               ],
                  //             ),
                  //             Gaps.vGap8,
                  //             AppTextFormField(controller: changeEmailController, focusNode: changeEmailFocus, hintText: ''),
                  //             Gaps.vGap8,
                  //             Padding(
                  //               padding: const EdgeInsets.all(16.0),
                  //               child: AppElevatedButton(text: 'تحديث', onPressed: (){}),
                  //             )
                  //           ],
                  //         ),
                  //       );
                  //     },);
                },
                isSvg: true,
              ),
              ProfileItemWidget(
                itemImage:SvgAssets.changePasswordIcon ,
                itemName:'تغير كلمة المرور' ,
                showArrow: true,
                onTap: (){
                  Constants.buildCustomShowModel(context: context, child: Container(
                    padding: EdgeInsets.all(16.r),
                    height: 393.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight:Radius.circular(30) ,topLeft: Radius.circular(30))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppTextFormField(suffixIcon: Icon(Icons.visibility,color: Color(0xffA7A7A7),),controller: currentPasswordController, focusNode: currentPasswordFocus, hintText: 'كلمة المرور الحالية'),
                        Gaps.vGap16,
                        AppTextFormField(suffixIcon: Icon(Icons.visibility,color: Color(0xffA7A7A7)),controller: newPasswordController, focusNode: newPasswordFocus, hintText: 'كلمة المرور الجديدة'),
                        Gaps.vGap16,
                        AppTextFormField(suffixIcon: Icon(Icons.visibility,color: Color(0xffA7A7A7)),controller: confirmPasswordController, focusNode: confirmPasswordFocus, hintText: 'تاكيد كلمة المرور'),
                        Gaps.vGap16,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: AppElevatedButton(buttonRadius: 50.r,text: 'تحديث', onPressed: (){}),
                        )
                      ],
                    ),
                  ));
                  // showBottomSheet(context: context,
                  //   builder: (context) {
                  //     return Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.only(topRight:Radius.circular(30) ,topLeft: Radius.circular(30))
                  //       ),
                  //       child: Column(
                  //         children: [
                  //           AppTextFormField(controller: currentPasswordController, focusNode: currentPasswordFocus, hintText: ''),
                  //           Gaps.vGap8,
                  //           AppTextFormField(controller: newPasswordController, focusNode: newPasswordFocus, hintText: ''),
                  //           Gaps.vGap8,
                  //           AppTextFormField(controller: confirmPasswordController, focusNode: confirmPasswordFocus, hintText: ''),
                  //           Gaps.vGap8,
                  //           Padding(
                  //             padding: const EdgeInsets.all(16.0),
                  //             child: AppElevatedButton(text: 'تحديث', onPressed: (){}),
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   },);
                },isSvg: true,
              ),
              ProfileItemWidget(
                itemImage:SvgAssets.callusIcon ,
                itemName:'تواصل معنا' ,
                showArrow: true,
                onTap: (){

                },isSvg: true,
              ),
              ProfileItemWidget(
                itemImage:SvgAssets.shareIcon ,
                itemName:'مشاركة التطبيق' ,
                showArrow: true,
                onTap: (){

                },isSvg: true,
              ),
              ProfileItemWidget(
                itemImage:SvgAssets.rateIcon ,
                itemName:'تقييم التطبيق' ,
                showArrow: true,
                onTap: (){

                },isSvg: true,
              ),
              ProfileItemWidget(
                itemImage:SvgAssets.recycleBinIcon ,
                itemName:'حذف الحساب' ,
                showArrow: true,
                onTap: (){

                },isSvg: true,
              ),
              ProfileItemWidget(
                itemImage:SvgAssets.logoutIcon ,
                itemName:'تسجيل خروج' ,
                showArrow: true,
                onTap: (){

                },isSvg: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildProfileContainer({required String txt}){
    return Container(
      padding: EdgeInsets.all(10.r),
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: colors.secondaryColor.withOpacity(.2)
      ),
      child: Text(txt,style: TextStyles.bold20(color:colors.secondaryColor ),),
    );
  }
}
