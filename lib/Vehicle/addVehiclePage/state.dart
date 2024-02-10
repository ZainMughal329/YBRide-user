import 'package:flutter/material.dart';
import 'package:get/get.dart';

class vehicleState{

  TextEditingController vehicleController = TextEditingController();
  TextEditingController pricePerDayController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController suitcaseController = TextEditingController();
  TextEditingController noOfVehiclesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxString typeVal = "Select".obs;
  RxString fuelTypeVal = "Gas".obs;
  RxString transmissionVal = "Automatic".obs;
  RxString bluetoothVal = "Enabled".obs;
  RxString acVal = "Active".obs;

  final vehicleType = '';


  final fuelTypeItems = <DropdownMenuItem>[
    DropdownMenuItem(
      child: Text('Gas'),
      value: 'Gas',
    ),DropdownMenuItem(
      child: Text('Petrol'),
      value: 'Petrol',
    ),
  ];
  final typeItems = <DropdownMenuItem>[
    DropdownMenuItem(
      child: Text('Economy'),
      value: 'Economy',
    ),DropdownMenuItem(
      child: Text('Premium'),
      value: 'Premium',
    ),
    DropdownMenuItem(
      child: Text('All-Wheel Drive SUV'),
      value: 'AllWheelDriveSUV',
    ),
    DropdownMenuItem(
      child: Text('SUV'),
      value: 'SUV',
    ),
    DropdownMenuItem(
      child: Text('Sedan'),
      value: 'Sedan',
    ),
  ];

  final transmissionItems = <DropdownMenuItem>[
    DropdownMenuItem(
      child: Text('Automatic'),
      value: 'Automatic',
    ),DropdownMenuItem(
      child: Text('Manual'),
      value: 'Manual',
    ),
  ];
  final bluetoothItems = <DropdownMenuItem>[
    DropdownMenuItem(
      child: Text('Enabled'),
      value: 'Enabled',
    ),DropdownMenuItem(
      child: Text('Disabled'),
      value: 'Disabled',
    ),
  ];
  final acItems = <DropdownMenuItem>[
    DropdownMenuItem(
      child: Text('Active'),
      value: 'Active',
    ),DropdownMenuItem(
      child: Text('Not Active'),
      value: 'NotActive',
    ),
  ];


}
