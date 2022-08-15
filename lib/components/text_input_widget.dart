import 'package:flutter/material.dart';
import 'package:price_checker/utils/colors.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final VoidCallback? onFieldSubmitted;
  final GestureTapCallback? onDoubleTapText;
  final IconData? trailingIcon;
  final String? hintText;
  final bool? isEditable;
  final bool? blackIcon;
  final GestureTapCallback? onDoubleTap;
  final bool? autofocus;
  final FocusNode? focusNode;

  const TextInputWidget(
      {Key? key,
      required this.controller,
      required this.onTap,
      this.onFieldSubmitted,
      this.onDoubleTapText,
      this.onDoubleTap,
      this.trailingIcon,
      this.hintText = '',
      this.isEditable,
      this.blackIcon,
      this.autofocus,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: kWhite,
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.2),
                spreadRadius: .5,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: Icon(
                  Icons.qr_code,
                  color: blackIcon ?? false ? kBlack : primaryColor,
                  // color: HexColor('#B9BABC'),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onDoubleTap: onDoubleTapText ?? () {},
                  child: TextFormField(
                    onFieldSubmitted: (value) =>
                        onFieldSubmitted == null ? null : onFieldSubmitted!(),
                    autofocus: autofocus ?? false,
                    focusNode: focusNode,
                    controller: controller,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //   RegExp('[0-9a-zA-Z @._]'))
                    // ],
                    style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: primaryColor,
                    ),
                    enabled: isEditable ?? true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      helperStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFFB9BABC),
                      ),
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onEditingComplete: () {},
                  ),
                ),
              ),
              trailingIcon == null
                  ? Container()
                  : InkWell(
                      onTap: onTap,
                      onDoubleTap: onDoubleTap ?? () {},
                      /*onTap: () {
                    if (_validateFields()) {
                      _searchTab_Controller.clearFetchList();
                      _searchTab_Controller.resetAllOnChange();
                      _searchTab_Controller.fetchDataFromApi(
                          searchType: _dv_searchType,
                          searchValue: _searchController.text.trim());
                    }
                  },*/
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: Icon(
                              trailingIcon,
                              color: blackIcon ?? false ? kBlack : kWhite,
                            )),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
