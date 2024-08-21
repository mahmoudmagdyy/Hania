import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/config/locale/app_localizations.dart';
import '/config/routes/app_routes.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/features/auth/presentation/widgets/pin_widget.dart';
import '/injection_container.dart';

class OtpAuthScreen extends StatefulWidget {
  const OtpAuthScreen({super.key});

  @override
  State<OtpAuthScreen> createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  final TextEditingController controller = TextEditingController(text: "");
  final FocusNode codeFocus = FocusNode();
  int pinLength = 4;
  double dashWidth = 10.0;
  final dashCount =
      (ScreenUtil.defaultSize.width / (2 * ScreenUtil.defaultSize.width))
          .floor();
  late Timer _timer;
  int _start = 60;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  Assets.otpLogoBackgroundImage,
                ),
                Gaps.vGap64,
                Text(
                  'verfy_code'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyles.regular22(),
                ),
                Gaps.vGap47,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Text(
                    'verfy_code_descreption'.tr,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: TextStyles.regular14(color: colors.unselected),
                  ),
                ),
                Gaps.vGap30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+9661756500553',
                      style: TextStyles.medium18(color: colors.unselected),
                    ),
                    Gaps.hGap10,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(Assets.otpEditPenSvg),
                    ),
                  ],
                ),
                Gaps.vGap64,
                PinCodeWidget(
                  pinLength: pinLength,
                  controller: controller,
                  focus: codeFocus,
                  textSubmit: (t) {},
                ),

                Gaps.vGap47,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: colors.unselected,
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                ),
                // SizedBox(
                //   width: ScreenUtil.defaultSize.width,
                //   height: 5.h,
                //   child: Flex(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     direction: Axis.horizontal,
                //     children: List.generate(dashCount, (_) {
                //       return SizedBox(
                //         width: dashWidth,
                //         height: 2.h,
                //         child: DecoratedBox(
                //           decoration: BoxDecoration(color: colors.errorColor),
                //         ),
                //       );
                //     }),
                //   ),
                // ),
                Gaps.vGap25,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'resend_code'.tr,
                      ),
                      Text(
                        '00:$_start',
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.resetPasswordRoute);
                  },
                  shape: const CircleBorder(),
                  child: const Text('Next'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  validator({required String isValid}) {
    if (isValid.isEmpty) {
      return 'Please Enter This Field';
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
