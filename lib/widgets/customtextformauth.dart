import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/constant/app_theme.dart';

import '../core/constant/custom_colors.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool? isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final Function(String)? onSubmitted; // Add this line

  CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      this.hinttext,
      this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      this.isNumber,
      this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onFieldSubmitted: (value) {},
        style: AppTheme.textTheme.bodyText1!.copyWith(color: Colors.grey),
        cursorColor: CustomColors.grey,
        keyboardType: isNumber ?? false
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          suffixIconColor: CustomColors.grey,
          fillColor: CustomColors.dividerLine.withAlpha(100),
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
              fontSize: 13.sp,
              color: CustomColors.grey,
              fontWeight: FontWeight.w400),
          labelStyle: TextStyle(
              fontSize: 13.sp,
              color: CustomColors.grey,
              fontWeight: FontWeight.w400),
          contentPadding:
              EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
          label: Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(labeltext ?? "")),
          suffixIcon: InkWell(child: Icon(iconData), onTap: onTapIcon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.sp),
            borderSide: BorderSide(
              color: CustomColors.dividerLine.withAlpha(150),
              width: 0.5.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.sp),
            borderSide: BorderSide(
              color: CustomColors.dividerLine.withAlpha(150),
              width: 0.5.w,
            ),
          ),
        ),
      ),
    );
  }
}
