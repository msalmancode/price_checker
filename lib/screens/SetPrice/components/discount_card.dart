import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/screens/SetPrice/set_price_controller.dart';
import 'package:price_checker/utils/colors.dart';

class DiscountInfoCard extends StatefulWidget {
  DiscountInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscountInfoCard> createState() => _DiscountInfoCardState();
}

class _DiscountInfoCardState extends State<DiscountInfoCard> {
  SetPriceController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    // height: 60,
                    // width: 60,
                    decoration: BoxDecoration(
                      color: kWhite.withOpacity(.3),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset("assets/icons/discount_icon.png"),
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  const Text(
                    'Discount',
                    maxLines: 1,
                    style: TextStyle(fontSize: 30),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: defaultPadding),
                ],
              ),
              Row(
                children: [
                  AutoSizeText(
                    controller.discount.toString(),
                    maxLines: 1,
                    style: const TextStyle(fontSize: 40),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Icon(Icons.percent, size: 32, color: Colors.grey.shade800),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: kWhite.withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    /*Container(
                      // margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: kWhite.withOpacity(.3),
                        border: Border.all(color: kWhite.withOpacity(.5)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.sync,
                          color: bgColor,
                          size: 32,
                        ),
                        onPressed: () {
                          // controller.editPrice();
                          // controller.show(context);
                        },
                      ),
                    ),*/
                    Expanded(
                      flex: 1,
                      child: Slider(
                          value: double.parse(controller.discount.toString()),
                          max: 90,
                          divisions: 18,
                          activeColor: bgColor,
                          inactiveColor: kGrey.withOpacity(.5),
                          label: controller.discount.round().toString(),
                          onChanged: (double value) {
                            if (value >= 10) {
                              controller.isLoading(true);
                              controller.discount = value.toInt();
                              // controller.updatePrice();
                              controller.isLoading(false);
                            }
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
