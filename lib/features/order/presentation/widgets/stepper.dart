import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepperItem extends StatefulWidget {
  final int? activeStep;

  const StepperItem({super.key, required this.activeStep});
  @override
  State<StepperItem> createState() => _StepperItemState();
}

class _StepperItemState extends State<StepperItem> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      enableStepTapping: false,
      finishedStepTextColor: Colors.grey,
      activeStepTextColor: Colors.grey,
      stepShape: StepShape.circle,
      titlesAreLargerThanSteps: false,
      activeStep: widget.activeStep ?? 0,
      lineStyle: const LineStyle(
        lineLength: 80,
        lineThickness: 1,
        lineSpace: 5,
      ),
      stepRadius: 16.r,
      unreachedStepIconColor: const Color(0xffC4C4C4),
      unreachedStepBorderColor: Colors.black54,
      unreachedStepTextColor: Colors.black,
      showLoadingAnimation: false,
      steps: const [
        EasyStep(
          icon: Icon(Icons.circle),
          title: 'عنوان الشحن',
          finishIcon: Icon(
            Icons.check,
            size: 40,
          ),
        ),
        EasyStep(
          icon: Icon(Icons.circle),
          title: 'طريقة الدفع',
          finishIcon: Icon(
            Icons.check,
            size: 40,
          ),
        ),
        EasyStep(
          icon: Icon(Icons.circle),
          title: 'تم بنجاح',
          finishIcon: Icon(
            Icons.check,
            size: 40,
          ),
        ),
      ],
      onStepReached: (index) {
        setState(() {
          // widget.activeStep = index;
        });
      },
    );
  }
}
