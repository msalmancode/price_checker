import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:price_checker/components/loader_widget.dart';
import 'package:price_checker/components/snackbar.dart';
import 'package:price_checker/components/text_input_widget.dart';
import 'package:price_checker/screens/SetPrice/components/discount_card.dart';
import 'package:price_checker/screens/SetPrice/set_price_controller.dart';
import 'package:price_checker/utils/colors.dart';

class SetPriceScreen extends StatefulWidget {
  const SetPriceScreen({Key? key}) : super(key: key);

  @override
  State<SetPriceScreen> createState() => _SetPriceScreenState();
}

class _SetPriceScreenState extends State<SetPriceScreen> {
  final controller = Get.put(SetPriceController());
  FocusNode scanShelfFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomLoaderWidget(
          isTrue: controller.isLoading.value,
          child: Scaffold(
            backgroundColor: kBgColor,
            body: SafeArea(
              child: SingleChildScrollView(
                primary: false,
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Column(
                            children: [
                              const SizedBox(height: defaultPadding),
                              DiscountInfoCard(),
                              const SizedBox(height: defaultPadding),
                              // StarageDetails(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    barcodeScanner(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  TextInputWidget barcodeScanner() {
    return TextInputWidget(
      controller: controller.barcodeController,
      focusNode: scanShelfFocusNode,
      autofocus: controller.isCameraOption ? false : true,
      trailingIcon: controller.isCameraOption ? Icons.qr_code_scanner : null,
      hintText: "Scan barcode",
      onFieldSubmitted: () {
        // sendButtonClick();
        if (controller.barcodeController.value.text.isEmpty) {
          showSnackBar("Error", "Please scan or enter barcode");
          return;
        }
        controller.newPriceCall();
      },
      onTap: () {
        // controller.scanBasketItems();
      },
    );
  }
}
