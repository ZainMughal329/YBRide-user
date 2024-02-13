



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/api.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

import '../../../../main.dart';
import '../../components/headingTextWidget.dart';
import '../../components/reuseableButton.dart';
import '../../components/subHeadingText.dart';

void ContactUsAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: CustomAlertDialog(),
        ),
      );
    },
  );
}

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:AppColors.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      // contentPadding: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
      title: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: HeadingTextWidget(title: 'Contact Us',fontSize:14,fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        // height: mq.height *0.4,
        child: StreamBuilder<QuerySnapshot>(
          stream: APis.db.collection('constants').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData && snapshot.data!.docs.isNotEmpty){
              var data = snapshot.data!.docs.first.data();
              var ybEmail = (data as Map<String, dynamic>)?['ybEmail'] as String? ?? '';
              var ybPhone = (data as Map<String, dynamic>)?['ybPhone'] as String? ?? '';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SectionWidget(ybEmail.toString()),
                  SizedBox(height:20),
                  SectionWidget( ybPhone.toString()),

                  SizedBox(height: 10),
                ],
              );


            }else if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            else{
              return Center(child: CircularProgressIndicator());

            }
          },

        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String text;

  SectionWidget( this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 15),
          child: Container(
            // height: mq.height*.005,
            width: 9,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black54
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(child: SubHeadingTextWidget(title: text,fontSize: 16,fontWeight: FontWeight.w500,
          // textColor: Theme.of(context).headingColor,

        )),
      ],
    );
  }
}