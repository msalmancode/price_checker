import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:price_checker/components/custom_alert.dart';
import 'package:price_checker/components/elevated_button.dart';
import 'package:price_checker/components/snackbar.dart';
import 'package:price_checker/components/textinput_widget.dart';
import 'package:price_checker/utils/colors.dart';

Future<void> showPasswordDialog(
  BuildContext context, {
  required TextEditingController controller,
  required Function onConfirmTap,
}) async {
  final formKey = GlobalKey<FormState>();
  controller.clear();
  Get.dialog(
    barrierDismissible: false,
    WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CustomAlert(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              const Text(
                'Confirmation',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: kLightTextColor,
                ),
              ),
              const SizedBox(height: 20),
              TextInput(
                hint: 'Password',
                controller: controller,
                obscure: true,
                leadingIcon: Icons.lock,
                suffixIcon: Icons.remove_red_eye_outlined,
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedBtn(
                      labelText: "Cancel",
                      isBorder: true,
                      callback: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedBtn(
                      labelText: "Ok",
                      callback: () {
                        // debugger();
                        formKey.currentState!.validate();
                        if (controller.text.isNotEmpty) {
                          Navigator.pop(context);
                          onConfirmTap();
                        } else {
                          showSnackBar('Validate', 'Please enter password');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
