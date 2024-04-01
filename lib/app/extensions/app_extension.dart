import 'package:alindor_assessment/app/di.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension Context on BuildContext {

  showLoader() {
    showDialog(
        context: this,
        barrierDismissible: false,
        useRootNavigator: false,
        barrierColor: $color.loaderOverlay,
        builder: (BuildContext context) => Center(
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0)),
            child: Center(
              child: Image(
                image: AssetImage($asset.loaderIcon),
                width: 50,
                height: 50,
              ),
            ),
          ),
        ));
  }

  dismissLoader() {
    pop;
  }

  showErrorAlert(String message) {
    Flushbar(
      shouldIconPulse: false,
      borderRadius: BorderRadius.circular($size.s8),
      padding: EdgeInsets.all($padding.p16),
      margin: EdgeInsets.only(
          top: $padding.p28, left: $padding.p16, right: $padding.p16),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(width: $padding.p14),
          SizedBox(
            width: MediaQuery.of(this).size.width * 0.7,
            child: Text(
              message,
              style: Theme.of(this)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.redAccent,
    ).show(this);
  }
}
