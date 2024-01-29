// // import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// final RegExp regexAadhar = RegExp(r'^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$');
// final RegExp regexPanCard = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}');
// final RegExp regexDriving = RegExp(
//     r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$');
//
// class UserData {
//   String documentType = 'Aadhar';
//   String documentId = '';
//   String name = '';
//   String gender = 'Male';
//   String address = '';
//   String remark = '';
//   String vehicleDetails = '';
//   static final UserData instance = UserData._internal();
//
//   factory UserData() {
//     return instance;
//   }
//
//   UserData._internal();
// }
//
// // @RoutePage()
// class VisitorDetailsPage extends StatefulWidget {
//   const VisitorDetailsPage({Key? key}) : super(key: key);
//
//   @override
//   State<VisitorDetailsPage> createState() => _VisitorDetailsPageState();
// }
//
// class _VisitorDetailsPageState extends State<VisitorDetailsPage> {
//   final UserData _userData = UserData();
//
//   TextEditingController documentIdController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController remarkController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   String? validateDocumentId(String? value) {
//     if (value == null || value.isEmpty) {
//       return "ID can't be empty";
//     }
//
//     RegExp regex;
//     switch (_userData.documentType) {
//       case 'Aadhar':
//         regex = regexAadhar;
//         break;
//       case 'PAN Card':
//         regex = regexPanCard;
//         break;
//       case 'Driving License':
//         regex = regexDriving;
//         break;
//       default:
//         return 'Invalid document type';
//     }
//
//     if (!regex.hasMatch(value)) {
//       return 'Invalid document ID format';
//     }
//
//     return null;
//   }
//
//   String? validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Enter your name";
//     }
//     if (value.length < 2) {
//       return "Name should be at least 2 characters long";
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Colors.blueAccent,
//         title: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Image.asset('lib/assets/AKGEC.png',width: MediaQuery.of(context).size.width/8,),
//               SizedBox(width: 10,),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("AJAY KUMAR GARG",style: TextStyle(color: Colors.white),),
//                   Text("ENGINEERING COLLEGE",style: TextStyle(color: Colors.white),),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children:<Widget>[
//             Container(
//               height: MediaQuery.of(context).size.height/20,
//               width: MediaQuery.of(context).size.width,
//               color: Colors.blueAccent,
//             ),
//             Positioned(child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               color: Colors.blue.shade50,
//             ),
//              top: MediaQuery.of(context).size.height/20,),
//
//           SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 ClipRRect(
//                 borderRadius: BorderRadiusDirectional.all(Radius.circular(9.0)),
//                 child: Container(
//                     color: Colors.white,
//                     width: MediaQuery.of(context).size.width/1.2,
//                     child: Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Form(
//                         key: _formKey,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset("lib/assets/imgDet.png",height: MediaQuery.of(context).size.height/5,),
//                             DropdownButtonFormField<String>(
//                               value: _userData.documentType,
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   _userData.documentType = value!;
//                                 });
//                               },
//                               items: ['Aadhar', 'PAN Card', 'Driving License']
//                                   .map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 labelText: 'Document Type',
//                                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                                 fillColor: Colors.grey.shade200,
//                                 border:OutlineInputBorder(
//                                   gapPadding: 0.0,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),),
//                             ),
//                             const SizedBox(height: 12),
//                             TextFormField(
//                               controller: documentIdController,
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 labelText: 'Document ID',
//                                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                                 fillColor: Colors.grey.shade200,
//                                 border:OutlineInputBorder(
//                                   gapPadding: 0.0,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),),
//                               onChanged: (value) {
//                                 if (_userData.documentType == 'Aadhar') {
//                                   value = value.replaceAll(' ', '');
//                                   if (value.length > 12) {
//                                     documentIdController.text = value.substring(0, 12);
//                                   }
//
//                                   if (value.length > 4) {
//                                     documentIdController.text =
//                                     '${value.substring(0, 4)} ${value.substring(4, value.length)}';
//                                   }
//
//                                   if (value.length > 8) {
//                                     documentIdController.text =
//                                     '${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, value.length)}';
//                                   }
//                                 }
//                                 setState(() {
//                                   _userData.documentId = value;
//                                 });
//                               },
//                               validator: validateDocumentId,
//                             ),
//                             const SizedBox(height: 12),
//                             TextFormField(
//                               controller: nameController,
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 labelText: 'Name',
//                                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                                 fillColor: Colors.grey.shade200,
//                                 border:OutlineInputBorder(
//                                   gapPadding: 0.0,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _userData.name = value;
//                                 });
//                               },
//                               validator: validateName,
//                             ),
//                             const SizedBox(height: 12),
//                             DropdownButtonFormField<String>(
//                               value: _userData.gender,
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   _userData.gender = value!;
//                                 });
//                               },
//                               items: ['Male', 'Female', 'Prefer not to say']
//                                   .map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 labelText: 'Gender',
//                                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                                 fillColor: Colors.grey.shade200,
//                                 border:OutlineInputBorder(
//                                   gapPadding: 0.0,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),),
//                             ),
//                             const SizedBox(height: 12),
//                             TextFormField(
//                               controller: addressController,
//                               maxLines: 3,
//                               minLines: 1,
//                               decoration:InputDecoration(
//                                 filled: true,
//                                 labelText: 'Address',
//                                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                                 fillColor: Colors.grey.shade200,
//                                 border:OutlineInputBorder(
//                                   gapPadding: 0.0,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _userData.address = value;
//                                 });
//                               },
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Fill your address here";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 12),
//                             TextFormField(
//                               controller: remarkController,
//                               decoration:InputDecoration(
//                                 filled: true,
//                                 labelText: 'Remark (Optional)',
//                                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                                 fillColor: Colors.grey.shade200,
//                                 border:OutlineInputBorder(
//                                   gapPadding: 0.0,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _userData.remark = value;
//                                 });
//                               },
//                             ),
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color.fromARGB(255, 102, 133, 250),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     // AutoRouter.of(context).pushNamed('/purpose');
//                                     if (kDebugMode) {
//                                       print('Document Type: ${_userData.documentType}');
//                                       print('Document ID: ${_userData.documentId}');
//                                       print('Name: ${_userData.name}');
//                                       print('Gender: ${_userData.gender}');
//                                       print('Address: ${_userData.address}');
//                                       print('Remark: ${_userData.remark}');
//                                     }
//                                   }
//                                 },
//                                 child: const Text('Next',style: TextStyle(color: Colors.white),),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//             // SizedBox(height:10),
//             Image.asset("lib/assets/blockChainLogo.png",
//               width: MediaQuery.of(context).size.width/1.4,
//             ),
//               ],
//             ),
//           ),
//         ),
//       ],),
//     );
//   }
// }
// import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PurposeData {
  String phoneNumber = '';
  String selectedPurpose = 'Admission';
  String customPurpose = '';

  static final PurposeData instance = PurposeData._internal();

  factory PurposeData() {
    return instance;
  }

  PurposeData._internal();
}

// @RoutePage(
//   deferredLoading: true,
// )
class PurposeDetailsScreen extends StatefulWidget {
  const PurposeDetailsScreen({super.key});

  @override
  State<PurposeDetailsScreen> createState() => _PurposeDetailsScreenState();
}

class _PurposeDetailsScreenState extends State<PurposeDetailsScreen> {
  final PurposeData _purposeData = PurposeData();

  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedPurpose = 'Admission';
  final TextEditingController _customPurposeController =
  TextEditingController();

  final List<String> _purposes = [
    'Admission',
    'Medical',
    'Counselling',
    'Fees',
    'Meet Director',
    'Other',
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.asset('lib/assets/AKGEC.png',width: MediaQuery.of(context).size.width/8,),
              SizedBox(width: 10,),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("AJAY KUMAR GARG",style: TextStyle(color: Colors.white),),
                  Text("ENGINEERING COLLEGE",style: TextStyle(color: Colors.white),),
                ],
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children:<Widget>[
      Container(
              height: MediaQuery.of(context).size.height/20,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent,
            ),
            Positioned(child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue.shade50,
            ),
             top: MediaQuery.of(context).size.height/20,),
          Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image.asset("lib/assets/imgDet.png",height: MediaQuery.of(context).size.height/5,),
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(9.0)),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration:InputDecoration(
                                filled: true,
                              labelText: 'Phone Number',
                              prefixText: '+91 ',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                fillColor: Colors.grey.shade200,
                                border:OutlineInputBorder(
                                  gapPadding: 0.0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),),

                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              _purposeData.phoneNumber = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your number";
                              }
                              if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                                return "Invalid number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 50),
                          const Text('Purpose of Visit:'),
                          DropdownButton<String>(
                            value: _selectedPurpose,
                            onChanged: (String? newValue) {
                              if (newValue == null) {
                                return;
                              }
                              _purposeData.selectedPurpose = newValue;
                              setState(() {
                                _selectedPurpose = newValue;
                              });
                            },
                            items: _purposes.map((String purpose) {
                              return DropdownMenuItem<String>(
                                value: purpose,
                                child: Text(purpose),
                              );
                            }).toList(),
                          ),
                          if (_selectedPurpose == 'Other')
                            TextFormField(
                              controller: _customPurposeController,
                              decoration:
                              InputDecoration(
                                filled: true,
                                labelText: 'Custom Purpose',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                fillColor: Colors.grey.shade200,
                                border:OutlineInputBorder(
                                  gapPadding: 0.0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),),
                              onChanged: (value) {
                                _purposeData.customPurpose = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter purpose here";
                                }
                                return null;
                              },
                            ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // AutoRouter.of(context).pushNamed('/image-capture');
                                if (kDebugMode) {
                                  print('Phone Number: +91 ${_purposeData.phoneNumber}');
                                  print('Purpose of Visit: $_selectedPurpose');
                                  if (_selectedPurpose == 'Other') {
                                    print('Custom Purpose: ${_purposeData.customPurpose}');
                                  }
                                }
                              }
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                            ),
                  ),
                ),

            Image.asset("lib/assets/blockChainLogo.png",
              width: MediaQuery.of(context).size.width/1.4,
            ),
              ],
            ),
          ),
      ],),
    );
  }
}
