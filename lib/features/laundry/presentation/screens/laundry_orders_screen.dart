import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/features/laundry/presentation/widgets/laundry_orders_container.dart';
import '../../../../core/widgets/gaps.dart';
import '../cubit/loundary_orders/loundary_orders_cubit.dart';
import '../cubit/loundary_orders/loundary_orders_state.dart';
import '../widgets/filter_container.dart';

class LaundryOrdersScreen extends StatefulWidget {
  const LaundryOrdersScreen({super.key});

  @override
  State<LaundryOrdersScreen> createState() => _LaundryOrdersScreenState();
}

class _LaundryOrdersScreenState extends State<LaundryOrdersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LaundryOrdersCubit, LaundryOrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gaps.vGap32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        context
                            .read<LaundryOrdersCubit>()
                            .changeOrdersType('current');
                      },
                      child: FilterContainer(
                        title: 'current',
                        value:
                            (state is CurrentOrders || state is OrdersInitial),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        context
                            .read<LaundryOrdersCubit>()
                            .changeOrdersType('finished');
                      },
                      child: FilterContainer(
                        title: 'finished',
                        value: (state is FinishedOrders),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        context
                            .read<LaundryOrdersCubit>()
                            .changeOrdersType('canceled');
                      },
                      child: FilterContainer(
                        title: 'canceled',
                        value: (state is CanceledOrders),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 65.h),
                    child: ListView.separated(
                      itemCount: 2,
                      separatorBuilder: (context, index) => Gaps.vGap10,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: LaundryOrdersContainer(
                          id: '#12345',
                          date: '12/12/2000',
                          time: '09:45',
                          address: 'الرياض , ابي بكر الرازي',
                          type:
                              (state is CurrentOrders || state is OrdersInitial)
                                  ? 'current'
                                  : (state is FinishedOrders)
                                      ? 'finished'
                                      : 'canceled',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
