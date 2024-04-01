import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/app/extensions/dimen_extension.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future appBottomSheet(BuildContext context, String title, Widget content) {
  return showBarModalBottomSheet(
      barrierColor: $color.loaderOverlay,
      backgroundColor: $color.recorderBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      topControl: const SizedBox.shrink(),
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              $padding.p10.ph,
              Center(
                child: Container(
                  height: 4,
                  width: 48,
                  decoration: BoxDecoration(
                      color: $color.border,
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              $padding.p10.ph,
              Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: $color.textColor,
                      fontSize: $fontSize.s16,
                      fontWeight: $fontWeight.semiBold),
                ),
              ),
              $padding.p10.ph,
              Divider(thickness: 0.7, height: 0, color: $color.border),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: $padding.p16, vertical: $padding.p10),
                child: content,
              ))
            ],
          ),
        );
      });
}
