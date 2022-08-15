import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:price_checker/utils/colors.dart';

class CustomLoaderWidget extends StatefulWidget {
  final bool? isTrue;
  final Widget? child;

  const CustomLoaderWidget({Key? key, this.isTrue, this.child})
      : super(key: key);

  @override
  _CustomLoaderWidgetState createState() => _CustomLoaderWidgetState();
}

class _CustomLoaderWidgetState extends State<CustomLoaderWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animationRotation;
  Animation<double>? animationRadiusIn;
  Animation<double>? animationRadiusOut;

  double radius = 0;
  final double initialRadius = 50;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    animationRotation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller!,
            curve: const Interval(0.0, 1.0, curve: Curves.linear)));

    animationRadiusIn = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller!,
            curve: const Interval(0.75, 1.0, curve: Curves.elasticIn)));

    animationRadiusOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller!,
            curve: const Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller!.addListener(() {
      setState(() {
        if (controller!.value >= 0.75 && controller!.value <= 1.0) {
          radius = animationRadiusIn!.value * initialRadius;
        } else if (controller!.value >= 0.0 && controller!.value <= 0.25) {
          radius = animationRadiusOut!.value * initialRadius;
        }
      });
    });

    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.stop();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isTrue == false) {
      controller!.stop();
    } else {
      controller!.repeat();
    }
    return WillPopScope(
      onWillPop: () async {
        return !widget.isTrue!;
      },
      child: AbsorbPointer(
        absorbing: widget.isTrue!,
        child: Stack(
          children: [
            widget.child!,
            if (widget.isTrue!)
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: kBlack.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      width: Get.width / 4,
                      height: Get.height / 7,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(100),
                        color: kWhite,
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                                radius: 50,
                                backgroundColor: kBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Image.asset(
                                      "assets/icons/app_logo_mini.png"),
                                )),
                          ),
                          Center(
                            child: Lottie.asset(
                              'assets/lottie_anim/loader_anim.json',
                              width: Get.width / 2,
                              height: Get.height / 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;

  const Dot({Key? key, this.radius, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
