import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Accounts/state.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';
import '../../../components/textField.dart';
import '../../../helper/api.dart';
import '../../../model/userModel/user_model.dart';

class AccountCon extends GetxController{
  final state =AccountState();


  DocumentSnapshot? documentSnapshot;
  UserModel? _userModel;
  fetchDataOfDrivers(String id) async {
    try {
      documentSnapshot =
      await FirebaseFirestore.instance.collection('web_users').doc(id).get();
      if (documentSnapshot!.exists) {
        print('id' + id);

        _userModel = UserModel(
            userName: documentSnapshot!['userName'],
            email: documentSnapshot!['Email'],);

        state.Name.value = documentSnapshot!['userName'];
      } else {
        print('empty');
      }
    } catch (e) {
      print('exception : ' + e.toString());
    } finally {}
  }

  Future<void> NameDialogAlert(BuildContext context, String Name, String id) {
    state.NameCon.text = Name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Center(
              child: SubHeadingTextWidget(
                title: 'Update Name',
                // textColor: Theme.of(context).headingColor,
                fontWeight: FontWeight.normal,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ReuseableTextField(
                    contr: state.NameCon,
                    label: 'Enter your  Name',
                    keyboardType: TextInputType.emailAddress,
                    obsecure: false,
                    textInputAction: TextInputAction.next,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: HeadingTextWidget(
                    title: 'Cancel',
                    textColor: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  )),
              TextButton(
                  onPressed: () {
                    //this  code will update the name in database
                    state.ref.doc(id).update(
                        {'userName': state.NameCon.text.toString()}).then((value) {
                      fetchDataOfDrivers(id);
                      state.NameCon.clear();
                    });

                    Navigator.pop(context);
                  },
                  child: SubHeadingTextWidget(
                    title: 'Ok',
                    // textColor: Theme.of(context).headingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ))
            ],
          );
        });
  }


}