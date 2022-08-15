import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/screens/dashboard/dashboard_controller.dart';
import 'package:price_checker/utils/colors.dart';

class NowInfoCard extends StatelessWidget {
  NowInfoCard({
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
                'Now',
                maxLines: 1,
                style: TextStyle(fontSize: 30, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.currency_pound,
                size: 55,
                color: Colors.white70,
              ),
              FittedBox(
                child: AutoSizeText(
                    controller.getPrice.value.nowPrice?.toStringAsFixed(2) ??
                        '0.0',
                    // '237648237648',
                    overflow: TextOverflow.clip,
                    style:
                        const TextStyle(fontSize: 70, color: Colors.white70)),
              )
            ],
          )
        ],
      ),
    );
  }
}
