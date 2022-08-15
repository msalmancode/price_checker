import 'package:flutter/material.dart';
import 'package:price_checker/utils/colors.dart';

class ElevatedBtn extends StatelessWidget {
  final String labelText;
  final VoidCallback callback;
  final bool? isBorder;

  const ElevatedBtn({
    Key? key,
    required this.labelText,
    required this.callback,
    this.isBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isBorder ?? false ? kWhite : bgColor,
          ),
          overlayColor: isBorder ?? false
              ? MaterialStateProperty.all(primaryColor.withOpacity(.1))
              : MaterialStateProperty.all(kGrey.withOpacity(.3)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: isBorder ?? false
                    ? const BorderSide(color: primaryColor, width: 1.0)
                    : const BorderSide(color: kWhite, width: 1.0)),
          ),
        ),
        onPressed: callback,
        child: Text(
          labelText,
          style: TextStyle(color: isBorder ?? false ? primaryColor : kWhite),
        ),
      ),
    );
  }
}
