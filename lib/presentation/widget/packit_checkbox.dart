import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackitCheckBox extends StatelessWidget {
  const PackitCheckBox({super.key, required this.value, required this.onChanged});

  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value!),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
        child: SizedBox(
          width: 20.w,
          height: 20.w,
          child: SvgPicture.asset('assets/icons/checkbox${value! ? '_fill' : ''}.svg'),
        ),
      ),
    );
  }
}

class PackitCheck extends StatelessWidget {
  const PackitCheck({super.key, required this.value, required this.onChanged});

  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value!),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
        child: SizedBox(
          width: 20.w,
          height: 20.w,
          child: SvgPicture.asset('assets/icons/check${value! ? '_fill' : ''}.svg'),
        ),
      ),
    );
  }
}
