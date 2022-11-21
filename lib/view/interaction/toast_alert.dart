
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/screens/widgets/spacer_widget.dart';


class ToastAlert {

  static showAlert(String message, {Function? onClick}) {
    BotToast.cleanAll();
    BotToast.showCustomNotification(
      toastBuilder: (cc) => Material(
        color: Colors.transparent,
        child: Container(
            margin: const EdgeInsets.only(top: 5, right: 16, left: 16),
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
            decoration: const BoxDecoration(
              color: AppColor.success,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline_rounded, color: Colors.white,),
                RowSpace(8),
                Expanded(
                  child: Text(message, style: TextStyle(
                    color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400
                  ),)
                ),
                InkWell(
                    onTap: () => cc(),
                    child: const Icon(Icons.cancel, color: Colors.white)
                )
              ],
            )
        ),
      ),
      align: Alignment.topCenter,
      duration: const Duration(seconds: 4),
    );
  }

  static showInfoAlert(String message, {Function? onClick}) {
    BotToast.cleanAll();
    BotToast.showCustomNotification(
      toastBuilder: (cc) => Material(
        color: Colors.transparent,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
            margin: const EdgeInsets.only(top: 5, right: 16, left: 16),
            decoration: const BoxDecoration(
              color: AppColor.black400,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded, color: Colors.white,),
                RowSpace(8),
                Expanded(
                    child: Text(message, style: TextStyle(
                        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400
                    ),)
                ),
                InkWell(
                  child: const Icon(Icons.cancel, color: Colors.white),
                  onTap: () => cc(),
                )
              ],
            )
        ),
      ),
      align: Alignment.topCenter,
      duration: const Duration(seconds: 5),
    );
  }

  static showErrorAlert(String message) {
    BotToast.showCustomNotification(toastBuilder: (cancelFunc) {
      return Material(
        color: Colors.transparent,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
            margin: const EdgeInsets.only(top: 5, right: 16, left: 16),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded, color: Colors.white,),
                RowSpace(8),
                Expanded(
                    child: Text(message, style: const TextStyle(
                      color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400
                    ),)
                ),
                InkWell(
                    onTap: () => cancelFunc(),
                    child: const Icon(Icons.close, color: Colors.white)
                )
              ],
            )
        ),
      );
    }, duration: const Duration(seconds: 8), align: Alignment.topCenter);
  }

  static showLoadingAlert(String message) {
    BotToast.cleanAll();
    BotToast.showLoading();
  }

  static showConfirmAlert(BuildContext context, String message, Function onOkay) {

    showDialog(
      // backgroundColor: Colors.transparent,
      context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Text(message, style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500
        ), textAlign: TextAlign.center,),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: TextStyle(
                color: Colors.white, fontSize: 14
            ),),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(22, 10, 22, 10)),
                backgroundColor: MaterialStateProperty.all(const Color(0xFF6C7E95).withOpacity(.60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ))
            ),
          ),
          RowSpace(5),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onOkay();
            },
            child: Text("Confirm", style: TextStyle(
                color: Colors.white, fontSize: 14
            ),),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(22, 10, 22, 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ))
            ),
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
      );
    },);
  }


  static closeAlert() {
    // Navigator.of(context).pop();
    BotToast.closeAllLoading();
    // BotToast.
  }
  static closeAllAlert(BuildContext context) {
    Navigator.of(context).pop();
  }
}


class OptionAlertItem {
  String name;
  Function onclick;
  Color? color;


  OptionAlertItem({required this.name, required this.onclick});
}