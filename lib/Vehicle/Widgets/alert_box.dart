import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../main.dart';
import '../../components/headingTextWidget.dart';
import '../../helper/appColors.dart';
import '../../helper/responsive.dart';

void showCustomAlertDialog(BuildContext context, String seats, String suitcases,
    String fuelType, String transmission, String ac, String bluetooth) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: CustomAlertDialog(
            seats: seats,
            suitcases: suitcases,
            fuelType: fuelType,
            transmission: transmission,
            ac: ac,
            bluetooth: bluetooth,
          ),
        ),
      );
    },
  );
}

class CustomAlertDialog extends StatelessWidget {
  final String seats;
  final String suitcases;
  final String fuelType;
  final String transmission;
  final String ac;
  final String bluetooth;

  const CustomAlertDialog(
      {super.key,
        required this.seats,
        required this.suitcases,
        required this.fuelType,
        required this.transmission,
        required this.ac,
        required this.bluetooth});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // contentPadding: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
      content: Container(
        width:  400,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: HeadingTextWidget(
                title: "Details",
                fontWeight: FontWeight.bold,
                textColor: AppColors.blackColor,
              ),
            ),
            Divider(),
            SizedBox(
              height: 25,
            ),
            _buildDetailItem(Icons.person, '${seats} seats', context),
            _buildDetailItem(
                Icons.cases_outlined, '${suitcases} suitcase(s)', context),
            _buildDetailItem(Icons.local_gas_station, '${fuelType}', context),
            Divider(),
            ResponsiveWidget.isSmallScreen(context) ? _buildDetailItem(
                Icons.wifi, '${transmission}\ntransmission', context) : _buildDetailItem(
                Icons.wifi, '${transmission} transmission', context),
            ac == 'Active'
                ? _buildDetailItem(Icons.snowing, 'A/C', context)
                : Container(),
            bluetooth == 'Enabled'
                ? _buildDetailItem(Icons.bluetooth, 'Bluetooth', context)
                : Container(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailItem(IconData icon, String text, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        SizedBox(
          width: 15,
        ),
        HeadingTextWidget(
          title: text,
          textColor: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}
