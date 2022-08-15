import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/screens/dashboard/dashboard_controller.dart';
import 'package:price_checker/utils/colors.dart';

class WasInfoCard extends StatelessWidget {
  WasInfoCard({
    Key? key,
  }) : super(key: key);
  DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding / 2),
                // height: 60,
                // width: 60,
                decoration: BoxDecoration(
                  color: kWhite.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/icons/pound_icon.png"),
                ),
              ),
              const SizedBox(width: defaultPadding),
              const Text(
                'Was',
                maxLines: 1,
                style: TextStyle(fontSize: 30, color: kWhite),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.currency_pound,
                size: 32,
                color: Colors.white70,
              ),
              AutoSizeText(
                controller.getPrice.value.wasPrice?.toString() ?? '0.0',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 50,
                      color: Colors.white70,
                    ),
              ),
              /*  CustomAnimatedWidget(
                  enabled: true,
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeOut,
                  builder: (context, percent) {
                    final counterValue =
                        ((controller.getPrice.value.wasPrice ?? 0) * percent)
                            .toStringAsFixed(2);
                    return AutoSizeText(
                      counterValue,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 40, color: Colors.white70),
                    );
                  }),*/
            ],
          )
        ],
      ),
    );
  }
}
