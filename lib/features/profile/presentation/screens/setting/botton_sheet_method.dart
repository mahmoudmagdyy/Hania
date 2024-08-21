import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/my_default_button.dart';
import '/injection_container.dart';

amrShowBottomSheet({
  required BuildContext context,
  required Widget body,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.r),
        topLeft: Radius.circular(30.r),
      ),
    ),
    builder: (context) {
      return body;
    },
  );
}

Future<void> displayLogoutDialog({
  required BuildContext context,
  required String alertContent,
  String? alerTitel,
  String? alertContent_2,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: colors.backGround,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
        //  insetPadding: EdgeInsets.all(20.r),
        actionsPadding: EdgeInsets.only(
          bottom: 32.5.h,
          right: 28.w,
          left: 28.w,
          top: 16.h,
        ),
        // titlePadding: EdgeInsets.only(top: 45.h, bottom: 41.h),
        title: Center(
          child: Text(
            alerTitel ?? '',
            style: TextStyles.bold24(),
          ),
        ),
        content: SizedBox(
          //  height: ScreenUtil.defaultSize.height * .1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                alertContent,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: TextStyles.bold14(),
              ),
              Gaps.vGap8,
              Text(
                alertContent_2 ?? "",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: TextStyles.bold14(),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        // actionsPadding: const EdgeInsets.all(0),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyDefaultButton(
                  color: Colors.white,
                  borderColor: colors.main,
                  height: 48.h,
                  width: 125.w,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderRadius: 5.r,
                  btnText: 'back_Amr',
                  textColor: Colors.black,
                ),
              ),
              Gaps.hGap36,
              Expanded(
                child: MyDefaultButton(
                  color: colors.main,
                  borderColor: colors.main,
                  height: 48.h,
                  width: 125.w,
                  onPressed: () async {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context);
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //   Routes.initialRoute,
                      //   (route) => false,
                      // );
                    });
                  },
                  borderRadius: 5.r,
                  btnText: 'submit',
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
