import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';

class PublicQuationScreen extends StatefulWidget {
  const PublicQuationScreen({super.key});

  @override
  State<PublicQuationScreen> createState() => _PublicQuationScreenState();
}

class _PublicQuationScreenState extends State<PublicQuationScreen> {
  bool isExpanded_0 = false;
  bool isExpanded_1 = false;
  bool isExpanded_2 = false;
  bool isExpanded_3 = false;
  bool isExpanded_4 = false;
  bool isExpanded_5 = false;
  bool isExpanded_6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    right: 21.w,
                    left: 11.w,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30.r,
                        ),
                      ),
                      Gaps.hGap10,
                      Text(
                        'public_quation'.tr,
                        style: TextStyles.bold16(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 21.w,
                        left: 11.w,
                      ),
                      child: Column(
                        children: [
                          Gaps.vGap60,
                          customPublicQuationWidget(
                            context: context,
                            itemTitel: 'public_quation_1',
                            itemDetails: 'details_public_quation_1',
                            itemIsExpanded: isExpanded_0,
                          ),
                          Gaps.vGap12,
                          customPublicQuationWidget(
                            context: context,
                            itemTitel: 'public_quation_2',
                            itemDetails: 'details_public_quation_1',
                            itemIsExpanded: isExpanded_1,
                          ),
                          Gaps.vGap12,
                          customPublicQuationWidget(
                            context: context,
                            itemTitel: 'public_quation_3',
                            itemDetails: 'details_public_quation_1',
                            itemIsExpanded: isExpanded_2,
                          ),
                          Gaps.vGap12,
                          customPublicQuationWidget(
                            context: context,
                            itemTitel: 'public_quation_4',
                            itemDetails: 'details_public_quation_1',
                            itemIsExpanded: isExpanded_3,
                          ),
                          Gaps.vGap12,
                          customPublicQuationWidget(
                            context: context,
                            itemTitel: 'public_quation_5',
                            itemDetails: 'details_public_quation_1',
                            itemIsExpanded: isExpanded_4,
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container customPublicQuationWidget({
    required BuildContext context,
    required String itemTitel,
    String? itemDetails,
    required bool itemIsExpanded,
    IconData? iconData,
  }) {
    return Container(
      decoration: BoxDecoration(
        color:
            itemIsExpanded ? colors.main : colors.buttonColor.withOpacity(.3),
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
          left: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
          right: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
          bottom: itemIsExpanded
              ? BorderSide.none
              : BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            itemTitel.tr,
            style: TextStyles.bold16(),
          ),
          onExpansionChanged: (value) {
            setState(
              () {
                itemIsExpanded = value;
                log(value.toString());
              },
            );
          },
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 9.h,
                right: 12.w,
                bottom: 25.h,
                left: 4.w,
              ),
              decoration: BoxDecoration(
                color: colors.baseColor,
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      itemIsExpanded ? Radius.zero : Radius.circular(16.r),
                  bottomRight:
                      itemIsExpanded ? Radius.zero : Radius.circular(16.r),
                ),
              ),
              child: Text(
                itemDetails!.tr,
                style: TextStyles.regular14(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
