import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/controller.dart';
import '../../../../main.dart';
import '../../../components/headingTextWidget.dart';
import '../../../components/reuseableButton.dart';
import '../../../components/subHeadingText.dart';
import '../../../components/textField.dart';
import '../../../helper/appColors.dart';

class SurferSignUpForm extends GetView<BecomeDriverCon> {
  const SurferSignUpForm({super.key});

  Widget _serviceList() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select Service',
              style: GoogleFonts.openSans(fontSize: 17),
            ),
            DropdownButton(
                iconEnabledColor: AppColors.buttonColor,
                hint: Text(
                  controller.state.serviceOffering.value,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text('Massachusetts'),
                    value: 'massachusetts',
                  ),
                  DropdownMenuItem(
                    child: Text('Virginia'),
                    value: 'virginia',
                  ),
                  DropdownMenuItem(
                    child: Text('District of Columbia'),
                    value: 'districtOfColumbia',
                  ),
                  DropdownMenuItem(
                    child: Text('Maryland'),
                    value: 'maryland',
                  ),
                ],
                onChanged: (value) {
                  controller.state.serviceOffering.value = value.toString();
                }),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BecomeDriverCon());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: AppColors.buttonColor,
                    child:Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(FontAwesomeIcons.xmark)),
                            ),
                          ),
                          Spacer(),
                          SubHeadingTextWidget(
                            title: 'You are applying for:',
                            textColor: Colors.white60,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HeadingTextWidget(
                            title: 'YBCar Driver Partner',
                            textColor: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(
                            flex: 2,
                          ),

                        ],
                      ),
                    ),



                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingTextWidget(
                          title: 'Description',
                          fontSize: 14,
                          // textColor: Theme.of(context).headingColor,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.9),
                          ),
                          child: Obx( () => controller.state.isCollapsed.value ? Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingTextWidget(
                                  title:
                                  'Rental Car Delivery Driver - Flexible Earning Opportunity!',
                                  // textColor: Theme.of(context).headingColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                  title:
                                  'Kyte is looking for passionate people who want to join our Kyte "Surfer" team! You will be responsible for delivering and picking up rental cars from different locations in your city. ',
                                  // textColor: Theme.of(context).lightTextColor,
                                  maxLines: controller.state.isCollapsed.value ? 3 : null,
                                  overflow: controller.state.isCollapsed.value
                                      ? TextOverflow.ellipsis
                                      : null,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                HeadingTextWidget(
                                  title: "Why you'll love working with Kyte:",
                                  // textColor: Theme.of(context).headingColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "a : Earn more: Earn more than the industry average, plus 100% of tips and bonuses!",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "b : Be your own boss: Choose when you want to work! ",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "c : Easy to get started: No car needed!",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                HeadingTextWidget(
                                  title: "Requirements:",
                                  // textColor: Theme.of(context).headingColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "a : Have a valid driver’s license and be legally authorized to work",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title: "b : Must be 21+ years old",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                HeadingTextWidget(
                                  title: "About the role:",
                                  // textColor: Theme.of(context).headingColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "a : You'll interact with customers as the face of the company - we're looking for people who are comfortable with face to face interactions!",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "b : Be ready to flag any maintenance, scratches, tire damage on the vehicles before delivery and after returns.",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "c : Weekends are our busiest times - look out for potential weekend bonuses!",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                    title:
                                    "d : Bonus points for a cool, crafty mode of transportation that will get you from one delivery/return to the next! This could be a scooter, scooter app, foldable bike, electric skateboard... show us what you've got!",
                                    // textColor:
                                    // Theme.of(context).lightTextColor
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    HeadingTextWidget(
                                      title: 'Job Type: ',
                                      // textColor:
                                      // Theme.of(context).headingColor,
                                    ),
                                    SubHeadingTextWidget(
                                        title: "Independent Contractor",
                                        // textColor:
                                        // Theme.of(context).lightTextColor
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    HeadingTextWidget(
                                      title: 'Salary: ',
                                      // textColor:
                                      // Theme.of(context).headingColor,
                                    ),
                                    SubHeadingTextWidget(
                                        title: "Task-based",
                                        // textColor:
                                        // Theme.of(context).lightTextColor
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ) : Container(
                            child:
                            Column(
                              children: [
                                HeadingTextWidget(
                                  title:
                                  'Rental Car Delivery Driver - Flexible Earning Opportunity!',
                                  // textColor: Theme.of(context).headingColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SubHeadingTextWidget(
                                  title:
                                  'YBRide is looking for passionate people who want to join our Kyte "Surfer" team! You will be....  ',
                                  // textColor: Theme.of(context).lightTextColor,
                                  maxLines: controller.state.isCollapsed.value ? 3 : null,
                                  overflow: controller.state.isCollapsed.value
                                      ? TextOverflow.ellipsis
                                      : null,
                                ),
                              ],
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                        ()=> Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.toggleCollapsed();
                          },
                          child: Center(
                            child: SubHeadingTextWidget(
                              title: controller.state.isCollapsed.value ? 'Collapse Content' : 'Continue Reading',
                              textAlign: TextAlign.center,
                              textColor: AppColors.buttonTextColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingTextWidget(
                          title: ' NAME ',
                          // textColor: Theme.of(context).headingColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ReuseableTextField(
                          contr: controller.state.NameCon,
                          label: ' Name',
                          textInputAction: TextInputAction.next,
                          inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
                          keyboardType: TextInputType.text,
                          obsecure: false),
                      SizedBox(
                        height: 10,
                      ),
                    ],),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: HeadingTextWidget(
                                title: 'EMAIL ',
                                // textColor: Theme.of(context).headingColor,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          ReuseableTextField(
                              contr: controller.state.emailCon,
                              label: 'Email',
                              textInputAction: TextInputAction.next,
                              useEmailValidation: true,
                              keyboardType: TextInputType.text,
                              obsecure: false),
                          SizedBox(
                            height: 10,
                          ),
                      ],))  ,
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: HeadingTextWidget(
                                  title: 'PHONE NUMBER ',
                                  // textColor: Theme.of(context).headingColor,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(
                                  () => PhoneNumberField(
                                  controller.state.code.value,
                                      () async {
                                    final code = await controller.state.countryPicker
                                        .showPicker(context: context);
                                    // Null check
                                    if (code != null) {
                                      controller.state.code.value = code;
                                    }
                                    ;
                                  },
                                  controller.state.phoneNumberCon,
                                  controller.state.focused.value,
                                      () {
                                    controller.state.focused.value =
                                    !controller.state.focused.value;
                                  },
                                  context),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],))
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child:
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: HeadingTextWidget(
                            title: 'WHAT CITY WILL YOU BE SURFING IN? ',
                            // textColor: Theme.of(context).headingColor,
                          ),
                        ),),
                        Expanded(child:
                        _serviceList())
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: SubHeadingTextWidget(
                      title:
                      'By providing us with your phone number and clicking "Submit", you agree that we may call or text you regarding your application. Message & data rates may apply.',
                      // textColor: Theme.of(context).lightTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(() => controller.state.loading == false?
                    RoundButton(
                    title: 'Submit',
                    onPress: () {
                      String id = DateTime.now().millisecondsSinceEpoch.toString();
                      controller.createSurfer(
                          id,
                          controller.state.NameCon.text.trim(),
                          controller.state.emailCon.text.trim(),
                          controller.state.phoneNumberCon.text.trim(),
                          controller.state.serviceOffering.value.trim()
                      );
                    },
                  ):Center(child: Lottie.asset('assets/lottie/loading2.json',height: 100,width: 100))),
                ],
              ),
              Positioned(
                top: 250,
                left: 630,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        image: DecorationImage(image: AssetImage('assets/images/yBRideLogo.jpg' ,),fit: BoxFit.fill)
                    ),
                    // child: Image.asset('assets/images/logo1.jpeg' , fit: BoxFit.contain,),
                    // color: AppColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget PhoneNumberField(CountryCode code, Function changeCountry,TextEditingController phone,bool isFocus , Function onPress,BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: InkWell(
      onFocusChange: (value) {
        final con = Get.put(BecomeDriverCon());
        con.onFocusChange(value ?? false);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: AppColors.activeTextFieldColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isFocus ? AppColors.activeTextFieldColor : AppColors.nonActiveTextFieldColor,
                )

            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: GestureDetector(
                        onTap: () => changeCountry(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                  child: CountryCodeFlagWidget(
                                    width: 32,
                                    alignment: Alignment.center,
                                    countryCode: CountryCode(
                                        name: code.name,
                                        code: code.code,
                                        dialCode: code.dialCode),
                                  ),
                                  )
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            TextWidget(
                              text: code.dialCode.toString(),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              // color: Theme.of(context).lightTextColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 1,
                    // color: Theme.of(context).lightTextColor,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: phone,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                        ),

                        // focusNode: focNode,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: InputBorder.none,
                          labelStyle: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget TextWidget({
  required String text,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
  );
}