import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extension.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../injection_container.dart';
import '../controller/get_static_pages/get_static_pages_cubit.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {

  @override
  void initState() {
    super.initState();
    if(context.read<GetStaticPagesCubit>().getPageBySlug('terms') == null){
      context.read<GetStaticPagesCubit>().fGetStaticPages(slug: 'terms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.termsAndConditions),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: BlocConsumer<GetStaticPagesCubit, GetStaticPagesState>(
          listener: (context, state) {
            if(state is GetStaticPagesErrorState){
              showAppSnackBar(context: context, message: state.message, type: ToastType.error);
            }
          },
          builder: (context, state) {
            if(state is GetStaticPagesLoadingState){
              return Center(
                child: const CircularProgressIndicator().appLoading,
              );
            }
            return Text(
              context.read<GetStaticPagesCubit>().getPageBySlug('terms')?.content??'',
              style: TextStyles.medium14(color: colors.body),
            );
          }
        ),
      ),
    );
  }
}
