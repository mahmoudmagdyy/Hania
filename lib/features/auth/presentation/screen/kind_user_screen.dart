import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../injection_container.dart';
import '/config/locale/app_localizations.dart';
import '/config/routes/app_routes.dart';
import '/core/utils/enums.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/features/auth/presentation/widgets/user_type_item_widget.dart';
import '../cubit/auto_login/auto_login_cubit.dart';

class KindUserScreen extends StatefulWidget {
  const KindUserScreen({super.key});

  @override
  State<KindUserScreen> createState() => _KindUserScreenState();
}

class _KindUserScreenState extends State<KindUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.baseColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'kind_user_titel'.tr,
                style: TextStyles.regular18(),
                textAlign: TextAlign.center,
              ),
              Gaps.vGap78,
              UserTypeItemWidget(
                onTap: () {
                  context
                      .read<AutoLoginCubit>()
                      .saveUserRole(type: UserType.user);
                  Navigator.pushNamed(context, Routes.loginScreenRoute);
                },
                itemImage: Assets.userImage,
                itemType: 'user_type_name'.tr,
                imageWidth: 154.w,
                imageHeight: 147.h,
              ),
              Gaps.vGap78,
              UserTypeItemWidget(
                onTap: () {
                  context
                      .read<AutoLoginCubit>()
                      .saveUserRole(type: UserType.doctor);
                  Navigator.pushNamed(context, Routes.loginScreenRoute);
                },
                itemImage: Assets.doctorImage,
                itemType: 'doctor_type_name'.tr,
                imageWidth: 155.w,
                imageHeight: 149.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
