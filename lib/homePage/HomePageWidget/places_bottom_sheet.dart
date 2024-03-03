import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:uuid/uuid.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:http/http.dart' as http;

Future<void> returnPlacesBottomSheet(BuildContext context) async {



return showModalBottomSheet(context: context, builder: (_){

  return Container(
    height: double.infinity,
    child: Center(
      child: ElevatedButton(
        onPressed: () async {

          final places = FlutterGooglePlacesSdk('AIzaSyA8mT_fcQoFRNpBokvTjVXsuc-TB9k-leI');

          final predictions =

          await places.findAutocompletePredictions('Boston');

          print('Result: $predictions');
         // print(predictions.predictions) ;

         //  print(predictions.predictions.toString());
         // printRes(predictions.predictions.toString());

        },
        child: Text('Predict and print to console'),
      ),
    ),
  );
},
);

}

























  // TextEditingController seacrchingController = TextEditingController();
  // var uuid = Uuid();
  // String sessionToken = uuid!.v4();
  //
  // Future<void> getSuggestions(String input) async{
  //   String placesBaseUrl = 'https://cors-anywhere.herokuapp.com/https://maps.googleapis.com/maps/api';
  //   String kPlacesApiKey =   'AIzaSyDw220zwlHJ1LnBdx0udN_NM2i4nucLLwA';
  //   String request =
  //       '$placesBaseUrl?input=$input&key=$kPlacesApiKey&sessiontoken=$sessionToken';
  //
  //  String proxyUrl = 'https://cors-anywhere.herokuapp.com/';
  //
  //   // HttpRequest.getString(proxyUrl + request).then((String response) {
  //   //   final data = json.decode(response);
  //   //   print(data); // Handle the response data here
  //   // }).catchError((error) {
  //   //   print('Error: $error');
  //   // });
  //   final response = await http.get(Uri.parse(request));
  //
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     print(data); // Handle the response data here
  //   } else {
  //     print(response.body.toString());
  //     print('Request failed with status: ${response.statusCode}');
  //   }
  //
  //
  //
  //
  //
  //   // try{
  //   //   var response = await http.get(Uri.parse(request)).then((response) {
  //   //
  //   //     if (response.statusCode == 200) {
  //   //       List predictions = jsonDecode(response.body.toString())['predictions'];
  //   //       List bostonPredictions = predictions.where((prediction) {
  //   //         return prediction['description'].toLowerCase().contains('boston');
  //   //       }).toList();
  //   //
  //   //        print("preection length"+bostonPredictions.length.toString());
  //   //       // cont.state.placeList.value =
  //   //       print("preection list"+bostonPredictions.toString());
  //   //
  //   //     } else {
  //   //       print(response.statusCode.toString());
  //   //       print(response.body.toString());
  //   //     }
  //   //   }).onError((error, stackTrace) {
  //   //     print("error"+error.toString());
  //   //   });
  //   // }catch(e){
  //   //   print("error"+e.toString());
  //   // }
  //
  // }
  //
  // seacrchingController.addListener(() {
  //   getSuggestions(seacrchingController.text.trim().toString());
  // });
  //
  //
  //
  //
  // return showModalBottomSheet(
  //     isScrollControlled: true,
  //     useSafeArea: true,
  //     context: context, builder: (_){
  //   // return FlutterGooglePlacesWeb(
  //   //   controller: seacrchingController,
  //   //   apiKey: AppConstants.kPlacesApiKey,
  //   //   // proxyURL: 'https://maps.googleapis.com/maps/api/place/details/json',
  //   //   components: 'country:us',
  //   //   required: true,
  //   //   sessionToken: true,
  //   // );
  //   return Container(
  //     height: double.infinity,
  //     child: TextFormField(
  //       controller: seacrchingController,
  //       decoration: InputDecoration(),
  //     ),
  //   );
  // });
