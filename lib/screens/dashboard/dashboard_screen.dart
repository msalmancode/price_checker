import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:price_checker/components/loader_widget.dart';
import 'package:price_checker/components/snackbar.dart';
import 'package:price_checker/components/text_input_widget.dart';
import 'package:price_checker/screens/dashboard/components/discount_card.dart';
import 'package:price_checker/screens/dashboard/components/now_card.dart';
import 'package:price_checker/screens/dashboard/components/was_info_card.dart';
import 'package:price_checker/screens/dashboard/dashboard_controller.dart';
import 'package:price_checker/utils/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = Get.put(DashboardController());
  FocusNode scanShelfFocusNode = FocusNode();

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
                    headerWidget(),
                    const SizedBox(height: defaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Column(
                            children: [
                              if (controller.getPrice.value.barcode != null)
                                Text(
                                  "Last Scanned : ${controller.getPrice.value.barcode?.toString() ?? ''}",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              const SizedBox(height: defaultPadding),
                              NowInfoCard(),
                              const SizedBox(height: defaultPadding),
                              DiscountInfoCard(),
                              const SizedBox(height: defaultPadding),
                              WasInfoCard(),
                              const SizedBox(height: defaultPadding),
                              // StarageDetails(),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  TextInputWidget headerWidget() {
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
        controller.getPriceCall();
      },
      onTap: () {
        // controller.scanBasketItems();
      },
    );
  }
}
