import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import '../../../../../main.dart';
import '../../../components/headingTextWidget.dart';
import '../../../components/reuseableButton.dart';
import '../../../components/textField.dart';

Future promoCodeBottomSheet(BuildContext context, CheckOutCon cont) {
  final state = CheckOutState();

  final scrollController = ScrollController();
  final focusNode = FocusNode();
  state.promoCodeCon.addListener(() {
    if (state.promoCodeCon.text.trim().isNotEmpty) {
      state.buttonVisible.value = true;
    } else {
      state.buttonVisible.value = false;
    }
  });
  return showModalBottomSheet(
    // backgroundColor: Theme.of(context).scaffoldBgClr,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Builder(builder: (BuildContext innerContext) {
        return SingleChildScrollView(
          controller: scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 900, // Set a maximum height for the bottom sheet
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.horizontal_rule,
                    size: 40,
                    color: Colors.grey.shade400,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.xmark),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the bottom sheet
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      HeadingTextWidget(
                          title: "Add promo code", fontWeight: FontWeight.bold),
                    ],
                  ),
                  Divider(
                    color: Colors.black54,
                    thickness: 0.4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ReuseableTextField(
                      contr: state.promoCodeCon,
                      focusNode: focusNode,
                      label: 'promo code',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      obsecure: false),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => state.buttonVisible.value
                        ? RoundButton(
                            title: 'Apply promo code',
                            onPress: () {
                              if (state.promoCodeCon.text.trim().isNotEmpty) {
                                cont.checkPromoCode(context,
                                    state.promoCodeCon.text.trim().toString());
                              } else {
                                Snackbar.showSnackBar(
                                    "YB-Ride",
                                    "Enter valid code",
                                    Icons.question_mark_outlined);
                              }
                            },
                          )
                        : Container(),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}
