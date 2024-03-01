import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/components/textField.dart';

import '../../../components/countryCodeTextField.dart';
import '../../../helper/api.dart';


Widget driverWidget(BuildContext context,CheckOutCon controller,TextEditingController nameCon,TextEditingController lName, TextEditingController eCon , TextEditingController pCon) {
  final state = controller.state;
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(.1)),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: HeadingTextWidget(
              title: '1. Driver',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: ReuseableTextField(
                      contr: nameCon,
                      label: 'First Name',
                      inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obsecure: false)),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: ReuseableTextField(
                      contr: lName,
                      label: 'Last Name',
                      textInputAction: TextInputAction.done,
                      inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
                      keyboardType: TextInputType.text,
                      obsecure: false)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: ReuseableTextField(
                    contr: eCon,
                    label: "Email",
                    textInputAction: TextInputAction.next,
                    useEmailValidation: true,
                    keyboardType: TextInputType.text,
                    obsecure: false),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: CountryCodePickerTextField(
                    controller: pCon,
                    label: 'Phone Number',
                    onChanged: (value) {
                      state.countryCode.value = value.dialCode.toString();
                    },
                  )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.withOpacity(.1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: [
                    Icon(Icons.credit_card_outlined),
                    SizedBox(
                      width: 15,
                    ),
                    SubHeadingTextWidget(
                        title:
                            "We will verify your driver's license after booking")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingTextWidget(title: 'Drive is under 25 years old '),
                    SizedBox(
                      height: 5,
                    ),
                    SubHeadingTextWidget(
                        title:
                            "We confirm the age on your driver's license after booking")
                  ],
                ),
                Obx(
                  () => _checkBox(
                    state.isDriverAge.value,
                    (value) {
                      state.isDriverAge.value = value;
                      if(value == true){
                        controller.addInTotalPrice(state.licenseFee, true);
                      }else if(value==false){
                        controller.subtractFromTotalPrince(state.licenseFee, true);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ),
  );
}

Widget driverWidgetSmall(TextEditingController nameCon,TextEditingController lName, TextEditingController eCon , TextEditingController pCon) {
  final state = CheckOutState();
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(.1)),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: HeadingTextWidget(
              title: '1. Driver',
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ReuseableTextField(
              contr: nameCon,
              label: 'First Name',
              textInputAction: TextInputAction.next,
              inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
              keyboardType: TextInputType.text,
              obsecure: false),
          SizedBox(
            height: 10,
          ),
          ReuseableTextField(
              contr: lName,
              label: 'Last Name',
              textInputAction: TextInputAction.done,
              inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
              keyboardType: TextInputType.text,
              obsecure: false),
          SizedBox(
            height: 10,
          ),
          ReuseableTextField(
              readOnly: true,
              contr: eCon,
              label: "Email",
              useEmailValidation: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              obsecure: false),
          SizedBox(
            height: 10,
          ),
          CountryCodePickerTextField(
            controller: pCon,
            label: 'Phone Number',
            onChanged: (value) {
              state.countryCode.value = value.dialCode.toString();
            },
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.withOpacity(.1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: [
                    Icon(Icons.credit_card_outlined),
                    SizedBox(
                      width: 15,
                    ),
                    SubHeadingTextWidget(
                      title:
                          "We will verify your driver's license after booking",
                      fontSize: 13,
                      textColor: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingTextWidget(
                      title: 'Drive is under 25 years old ',
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SubHeadingTextWidget(
                      title:
                          "We confirm the age on your driver's license after booking",
                      fontSize: 11,
                    )
                  ],
                ),
                Obx(
                  () => _checkBox(state.isDriverAge.value, (value) {
                    state.isDriverAge.value = value;
                  }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ),
  );
}

Widget _checkBox(bool val, ValueChanged<bool>? onChanged) {
  return Checkbox(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.withOpacity(.2), width: .8)),
      visualDensity: VisualDensity.compact,
      value: val,
      onChanged: (bool? value) {
        onChanged?.call(value!);
      });
}
