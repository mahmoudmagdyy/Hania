import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/features/home/presentation/pages/more_services_screen.dart';

import '/features/home/presentation/widgets/service_item.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';
import '../widgets/offers_gallery.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Gaps.vGap50,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: colors.main,
                      radius: 30.r,
                    ),
                    Gaps.hGap8,
                    Text(
                      "${'hello'.tr} محمد"
                      ,
                      style: TextStyles.bold14(color: Colors.black),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xffEEEEEE),
                  ),
                  padding: EdgeInsets.all(16.r),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.notificationsScreenRoute);
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SvgPicture.asset(SvgAssets.notification),
                        CircleAvatar(
                          radius: 8.r,
                          backgroundColor: colors.secondaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gaps.vGap20,
            AppTextFormField(
              radius: 15.r,
                controller: searchController,
                focusNode: searchFocus,
                hintText: 'search_services'.tr,
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: colors.secondaryColor,
                )),
            Gaps.vGap20,
            const OffersGallery(),
            _buildMainRow(txt: 'our_services'.tr,context: context),
            GridView.builder(
              itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, Routes.orderScreenRoute),
                  child: const ServiceItem()),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildMainRow({required String txt,required context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          SvgPicture.asset(SvgAssets.homeRowIcon),
          Text(
            txt,
            style: TextStyles.bold20(),
          ),
        ],),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MoreServicesScreen(),));
           // Navigator.pushNamed(context, Routes.moreServicesScreenRoute);
          },
          child: Text(
            'more'.tr,
            style: TextStyles.regular18(color: colors.secondaryColor),
          ),
        )
      ],
    );
  }
}
