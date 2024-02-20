import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/time_bottom_sheet.dart';
import 'package:yb_ride_user_web/homePage/controller.dart';

Future<void> rangePicker(BuildContext context , HomePageCon cont) async{
  return showModalBottomSheet(
    backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: true,
      showDragHandle: true,
      context: context, builder: (_){
    return Stack(
      children: [
        SfDateRangePicker(
          backgroundColor: Colors.white,
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.range,
          // minDate: DateTime(
          //     2024, int.parse("${cont.state.fromMonth.value}"), int.parse("${cont.state.fromDate.value}")),
          maxDate: DateTime(2029, 12, 31),
          todayHighlightColor: AppColors.buttonColor,
          viewSpacing: 5,
          headerStyle: DateRangePickerHeaderStyle(
            textStyle:
            GoogleFonts.openSans(fontWeight: FontWeight.w600),
          ),
          monthViewSettings: DateRangePickerMonthViewSettings(
            // viewHeaderHeight: 50,
            showTrailingAndLeadingDates: false,
            dayFormat: 'EEE',
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle:
              GoogleFonts.openSans(fontWeight: FontWeight.w700),
            ),
          ),
          monthCellStyle: DateRangePickerMonthCellStyle(
            cellDecoration: BoxDecoration(),
            textStyle:
            GoogleFonts.openSans(fontWeight: FontWeight.w500),
          ),
          yearCellStyle: DateRangePickerYearCellStyle(
            textStyle:
            GoogleFonts.openSans(fontWeight: FontWeight.w500),
          ),
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            // TODO: implement your code here
            cont.extractStartEndDate(args.value.toString());
          },
          navigationDirection:
          DateRangePickerNavigationDirection.vertical,
          navigationMode: DateRangePickerNavigationMode.scroll,
          // selectionMode: DateRangePickerSelectionMode.range,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColors.buttonColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          timeSelBottomSheet(context, cont, true);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Obx(() {
                                return SubHeadingTextWidget(
                                  title:
                                  "${cont.state.fromDateName.value} ${cont.state.fromMonthName.value} ${cont.state.fromDate.value} 20${cont.state.fromYear.value}",
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w600,
                                );
                              }),
                              Obx((){
                                return SubHeadingTextWidget(
                                  textColor: Colors.black54,
                                  title: '${cont.state.fromTime.value}',);
                              }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          height: 60,
                          width: 3,
                          color: AppColors.dotColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          timeSelBottomSheet(context, cont, false);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Obx(() {
                                return SubHeadingTextWidget(
                                    title:
                                    "${cont.state.toDateName.value} ${cont.state.toMonthName.value} ${cont.state.toDate.value} 20${cont.state.toYear.value}",
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.w600);
                              }),
                              Obx((){
                                return SubHeadingTextWidget(
                                  title: '${cont.state.toTime.value}',textColor: Colors.black54,);
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RoundButton(title: "Choose date & time",
                    onPress: () {
                      if(cont.state.startEndDateSelected.value == true
                      ){
                        cont.state.timeandDateSelected.value = true;
                        cont.state.fromTimeinMiliSeconds = cont.convertTimeEpoch(cont.state.fromTime.value).toString();
                        cont.state.toTimeinMiliSeconds = cont.convertTimeEpoch(cont.state.toTime.value).toString();
                        Navigator.pop(context);
                      }else{
                        Snackbar.showSnackBar("Error","Select Date & Time", Icons.error_outline_outlined);
                      }


                    }),
              ],
            ),
          ),
        ),
      ],
    );
  });
}