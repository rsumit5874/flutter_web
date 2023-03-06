import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant.dart';
import '../../resource/dimen.dart';
import '../../resource/strings.dart';

class CustomRatingDropdown extends StatelessWidget {
  final String hintText;
  final String? selectedValue;
  final Function(String) onSelect;
  final List<String> listItem;

  const CustomRatingDropdown({
    Key? key,
    required this.hintText,
    required this.selectedValue,
    required this.onSelect,
    required this.listItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade500, width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              onChanged: (value) {
                onSelect(value!);
              },
              hint: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  (selectedValue == null || selectedValue!.isEmpty)
                      ? hintText
                      : selectedValue!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              isExpanded: true,
              items: listItem
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(e, style: const TextStyle(fontSize: 16)),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}

class SkillContainer extends StatelessWidget {
  final String? selectedRating;
  final String question;
  final List<String>? listOfOption;
  final Function(String)? rationOnSkill;

  const SkillContainer(
      {Key? key,
      this.listOfOption,
      this.selectedRating,
      required this.question,
      this.rationOnSkill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.black26),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: size10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Text(
                question,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: size16,
                    fontWeight: FontWeight.w700),
              )),
              SizedBox(
                width: size100,
                child: CustomRatingDropdown(
                  selectedValue: selectedRating!,
                  hintText: Strings.select,
                  onSelect: (onSelect) {
                    if (rationOnSkill != null) {
                      rationOnSkill!(onSelect);
                    }
                  },
                  listItem: listOfRating,
                ),
              ),
            ],
          ),
        ),
        listOfOption != null
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: size10),
                itemCount: listOfOption?.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: size5, horizontal: size15),
                      child: Text(
                        listOfOption![index],
                        style: const TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                            fontSize: size16,
                            color: Colors.black),
                      ));
                })
            : const SizedBox()
      ],
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < desktopWidth &&
      MediaQuery.of(context).size.width >= tabletWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= desktopWidth) {
      return desktop;
    } else if (size.width >= tabletWidth && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

class AppWidget {
  static Widget getButton(String buttonName,
      {double? width,
      double? height,
      Color? textColor = Colors.white,
      required Color buttonColor,
      Function()? onClick}) {
    return SizedBox(
      width: width ?? Get.width,
      height: height ?? size40,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: Colors.grey.shade500),
            borderRadius: const BorderRadius.all(Radius.circular(size5))),
        child: TextButton(
            onPressed: onClick,
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(color: textColor, fontSize: size16),
              ),
            )),
      ),
    );
  }

  static Widget getTitleText(String text,
      {Color? textColor = Colors.black,
      double? fontSize = size16,
      FontWeight? fontWeight,
      double? letterSpacing}) {
    return Text(text,
        style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight));
  }
}
