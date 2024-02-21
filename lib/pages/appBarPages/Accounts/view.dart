
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
import 'package:yb_ride_user_web/components/textField.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Accounts/controller.dart';
import 'package:yb_ride_user_web/pages/appBarPages/appBarFooter/appBatFooter.dart';

import '../../../components/countryCodeTextField.dart';
import '../../../components/drwer.dart';
import '../../../components/headingTextWidget.dart';
import '../../../helper/api.dart';
import '../../../helper/responsive.dart';
import '../Become_Driver/view.dart';
import '../FaqS/view.dart';
import '../Referrals/view.dart';
import '../Trips/view.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AccountCon());
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    return Scaffold(

      key: _scaffoldKey,
      drawer: BuildDrawer.buildDrawer(context),
      drawerScrimColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        // scrolledUnderElevation: 1,
        leading: Container(),
        title: Padding(
          padding:  EdgeInsets.only(left: 20),
          child: HeadingTextWidget(title:'YBRide',fontWeight: FontWeight.bold,fontSize:30 ,),
        ),
        actions: ResponsiveWidget.isLargeScreen(context)
            ?  [
          InkWell(
            onTap: () {
              Get.to(() => BecomeDriverPage());
            },
            child: HeadingTextWidget(
                title: 'Become a driver partner',
                textColor: AppColors.appBarTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: 20,
          ),
          HeadingTextWidget(
              title: '|',
              textColor: AppColors.appBarTextColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Get.to(() => FaqPage());
            },
            child: HeadingTextWidget(
                title: 'FAQ',
                textColor: AppColors.appBarTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Get.to(() => AccountPage());
              },
              child: HeadingTextWidget(
                title: 'Account',
                textColor: AppColors.appBarTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              )),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Get.to(() => ReferralPage());
              },
              child: HeadingTextWidget(
                title: 'Referrals',
                textColor: AppColors.appBarTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              )),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Get.to(() => TripsPages());
              },
              child: HeadingTextWidget(
                  title: 'My Trips',
                  textColor: AppColors.appBarTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
              onTap: () {
              },
              child: HeadingTextWidget(
                  title: 'Sign out',
                  textColor: AppColors.appBarTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            width: 30,
          ),
        ] :[
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      body: ResponsiveWidget.isLargeScreen(context)? SingleChildScrollView(
        child: Center(
          child: StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
            stream: APis.db.collection('web_users').doc(APis.auth.currentUser!.uid).snapshots(),
            builder: (BuildContext context ,snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Lottie.asset('assets/lottie/loading2.json'),
                  ),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 740),
                      child: HeadingTextWidget(title: 'Account',fontWeight: FontWeight.bold,fontSize: 30,)),
                  SizedBox(height: 20,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 260),
                      child:InkWell(
                          onTap: (){
                            con.NameDialogAlert(context, con.state.Name.value.toString(), snapshot.data!['id'].toString());
                          },
                          child: reusebaleTextFields(title: 'Name', iconData: Icons.percent_outlined, value: snapshot.data!['userName'].toString()))
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 260),
                    child: reusebaleTextFields(title: 'Email', iconData: Icons.email_outlined, value: snapshot.data!['Email'].toString()),
                  ),
                  SizedBox(height: 50,),
                  Divider(),
                  SizedBox(height: 20,),
                  appBarFooter(),
                  SizedBox(
                    height: 20,
                  ),

                ],
              );



            },

          ),
        ),
      ) :

      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 20),
          child: Center(
            child: StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
              stream: APis.db.collection('web_users').doc(APis.auth.currentUser!.uid).snapshots(),
              builder: (BuildContext context,snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Lottie.asset('assets/lottie/loading2.json'),
                    ),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: HeadingTextWidget(title: 'Account',fontWeight: FontWeight.bold,fontSize: 20,),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap: (){
                          con.NameDialogAlert(context, con.state.Name.value.toString(), snapshot.data!['id'].toString());
                        },
                        child: reusebaleTextFields(title: 'Name', iconData: Icons.percent_outlined, value: snapshot.data!['userName'].toString())),
                    SizedBox(height: 20,),

                    reusebaleTextFields(title: 'Email', iconData: Icons.email_outlined, value: snapshot.data!['Email'].toString()),

                    SizedBox(height: 50,),
                    Divider(),
                    SizedBox(height: 20,),
                    ResponsiveWidget.isLargeScreen(context) ? appBarFooter() : appBarFooterSmall(context),
                    SizedBox(
                      height: 20,
                    ),

                  ],
                );

              },

            ),
          ),
        ),
      )
      ,
    );
  }
}
class reusebaleTextFields extends StatelessWidget {
  final String title, value;
  final Color? iconColor, valueColor;
  final VoidCallback? onpress;
  final IconData iconData;

  reusebaleTextFields({
    Key? key,
    required this.title,
    this.iconColor,
    this.onpress,
    this.valueColor,
    required this.iconData,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonColor),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        title: GestureDetector(
          onTap: () {
            onpress;
          },
          child: AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                hintText: title,
                hintStyle: GoogleFonts.poppins(
                    textStyle:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.buttonColor
                    )
                ),
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
        leading: Icon(
          iconData,
          color: AppColors.buttonColor,
          size: 30,
        ),
        trailing: Container(
          decoration: BoxDecoration(
            border: Border.all(color:AppColors.buttonColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),

            child: Text(
                value,
                style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.buttonColor
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}