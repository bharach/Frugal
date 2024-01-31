import 'dart:convert';
import 'dart:typed_data';
import 'package:alphanum_comparator/alphanum_comparator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientapp/screens/dashboard/calender.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patientapp/Models/patientdetail.dart';
import 'package:patientapp/resources/firestoreAppoint.dart';

import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';

class CacheManager {
  static final DefaultCacheManager _cacheManager = DefaultCacheManager();

  static Future<List<List<Map<String, dynamic>>>> fetchData(
      String cacheKey) async {
    try {
      final List<List<Map<String, dynamic>>> data = [];
      _cacheManager.emptyCache;
      DefaultCacheManager().emptyCache();
      FileInfo? fileInfo = await _cacheManager.getFileFromCache(cacheKey);
      if (fileInfo != null && fileInfo.file.existsSync()) {
        final dynamic decodedData =
            json.decode(utf8.decode(fileInfo.file.readAsBytesSync()));
        print(decodedData.runtimeType);
        if (decodedData is List<dynamic>) {
          for (dynamic listItem in decodedData) {
            if (listItem is List<dynamic>) {
              List<Map<String, dynamic>> innerList = [];
              for (dynamic innerMap in listItem) {
                if (innerMap is Map<String, dynamic>) {
                  innerList.add(innerMap);
                }
              }
              data.add(innerList);
            }
          }
          return data;
        } else {
          return [];
        }
      } else {
        List<List<Map<String, dynamic>>> data = await getHealthpost();
        _cacheManager.putFile(
          cacheKey,
          Uint8List.fromList(utf8.encode(json.encode(data))),
        );
        return data;
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<List<Map<String, dynamic>>>> getHealthpost() async {
    final List<Map<String, dynamic>> listHealth = [];
    final List<Map<String, dynamic>> listDoctor = [];
    final List<List<Map<String, dynamic>>> listdata = [];

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var healthPost =
        await _firestore.collection('Hospitals').orderBy('HospitalName').get();
    for (int i = 0; i < healthPost.docs.length; i++) {
      Map<String, dynamic> healthData = {
        'HospitalId': healthPost.docs[i].id,
        'HospitalName': healthPost.docs[i].data()['HospitalName'],
        'Specialities': healthPost.docs[i].data()['Specialties'],
        'Address':
            "${healthPost.docs[i].data()['Address']['City']} ${healthPost.docs[i].data()['Address']['Region']} ${healthPost.docs[i].data()['Address']['Street']} ",
      };
      //get Doctor data
      if (healthData.isNotEmpty) {}
      var doctor = await _firestore
          .collection('Hospitals')
          .doc(healthPost.docs[i].id)
          .collection('Doctors')
          .get();
      print(healthPost.docs[i].id);
      for (int j = 0; j < doctor.docs.length; j++) {
        Map<String, dynamic> healthpostDoctor = {
          'HospitalId': healthPost.docs[i].id,
          'DoctorId': doctor.docs[j].id,
          'DoctorName': doctor.docs[j].data()['Name'],
          'Specialities': doctor.docs[j].data()['Specialities']
        };
        listDoctor.add(healthpostDoctor);
      }
      listHealth.add(healthData);
    }
    listHealth.sort((a, b) =>
        AlphanumComparator.compare(a['HospitalName'], b['HospitalName']));

    listdata.add(listHealth);
    listdata.add(listDoctor);
    return listdata;
  }
}

class BookAppointmentScreen extends StatefulWidget {
  final String docid;
  BookAppointmentScreen({super.key, required this.docid});
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  List<List<Map<String, dynamic>>> listHealth = [];
  String hospitalName = '';
  String selectedHospital = '';
  String spec = '';
  List<String> specialities = [];
  List<String> doctorName = [];
  AppointmentData detail = AppointmentData();

  @override
  void initState() {
    super.initState();
    loadInitialData();
    detail.userId = widget.docid;
  }

  Future<void> loadInitialData() async {
    listHealth = await CacheManager.fetchData('HealthFacility');
    if (listHealth.isNotEmpty) {
      print(listHealth[0][0]);
//Get Default Initial Hospital
      hospitalName = listHealth[0][0]['HospitalName'];
//Get Default Initial Specialilty
      updateSpecialities();
    }
  }

  void updateSpecialities() {
    specialities = listHealth[0]
        .firstWhere(
            (entry) => entry['HospitalName'] == hospitalName)['Specialities']
        .cast<String>()
        .toList();
    setState(() {});
  }

  List<String> updateDoctor(String hospitalId, String spec) {
    var matchingDoctors = listHealth[1]
        .where((element) =>
            element['HospitalId'] == hospitalId &&
            (element['Specialities'] as List).contains(spec))
        .map<String>((element) => element['DoctorName'] as String)
        .toList();
    return matchingDoctors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
        child: SizedBox(
          height: 55,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().subMitBtnPadding),
            child: SubmitButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalenderScreen(data: detail),
                    ),
                  );
                },
                text: AppLocalizations.of(context)!.translate39,
                textColor: AppColor.submitBtnTextWhite,
                borderColor: AppColor.primaryBtnBorderColor),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().screenContaintPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                AppBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                MainTittleText(
                  tittle: AppLocalizations.of(context)!.translate38,
                  maxTextlines: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                BodySubTittleText(
                  tittle: AppLocalizations.of(context)!.translate77,
                  maxTextlines: 5,
                ),
                //! Health Speciality
                const SizedBox(height: 25),
                AppTiitleText(
                  tittle: AppLocalizations.of(context)!.translate41,
                  fontweight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (listHealth.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 0.5,
                              offset: const Offset(2, 05),
                              color: const Color.fromRGBO(0, 0, 0, 1)
                                  .withOpacity(0.1),
                            )
                          ],
                        ),
                        child: DropdownMenu(
                          inputDecorationTheme: const InputDecorationTheme(
                            border: InputBorder.none,
                          ),
                          dropdownMenuEntries: listHealth[0]
                              .map<DropdownMenuEntry<String>>(
                                  (Map<String, dynamic> entry) {
                            String name = entry['HospitalName'] as String;
                            return DropdownMenuEntry<String>(
                                value: name, label: name);
                          }).toList(),
                          hintText: AppLocalizations.of(context)!.translate79,
                          // initialSelection: listHealth[0]['HospitalName'],
                          textStyle: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff666666),
                          ),
                          trailingIcon: Image.asset(
                            "assets/icons/chevron.png",
                            width: 10,
                            height: 10,
                            color: Colors.black,
                          ),

                          selectedTrailingIcon: Image.asset(
                            "assets/icons/up_arrow.png",
                            width: 10,
                            height: 10,
                            color: Colors.black,
                          ),
                          width: ScreenSize.width(context) -
                              (AppDimension().screenContaintPadding * 2),

                          onSelected: (value) {
                            setState(() {
                              selectedHospital = value.toString();
                              hospitalName = selectedHospital;
                              updateSpecialities();
                            });
                          },
                        ),
                      ),
                      //! Doctor Speciality
                      const SizedBox(
                        height: 25,
                      ),
                      AppTiitleText(
                        tittle: AppLocalizations.of(context)!.translate42,
                        fontweight: FontWeight.w600,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      if (specialities.isNotEmpty)
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                spreadRadius: 0.5,
                                offset: const Offset(2, 05),
                                color: const Color.fromRGBO(0, 0, 0, 1)
                                    .withOpacity(0.1),
                              )
                            ],
                          ),
                          child: DropdownMenu(
                            inputDecorationTheme: const InputDecorationTheme(
                              border: InputBorder.none,
                            ),
                            dropdownMenuEntries: specialities
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                value: value,
                                label: value,
                              );
                            }).toList(),
                            hintText: AppLocalizations.of(context)!.translate80,
                            // initialSelection: specialities[0],
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff666666),
                            ),
                            trailingIcon: Image.asset(
                              "assets/icons/chevron.png",
                              width: 10,
                              height: 10,
                              color: Colors.black,
                            ),

                            selectedTrailingIcon: Image.asset(
                              "assets/icons/up_arrow.png",
                              width: 10,
                              height: 10,
                              color: Colors.black,
                            ),
                            width: ScreenSize.width(context) -
                                (AppDimension().screenContaintPadding * 2),

                            onSelected: (value) {
                              setState(() {
                                // spec = value.toString();
                                detail.doctorSpec = value.toString();
                                detail.hospitalName = selectedHospital;
                                detail.hospitalId = listHealth[0].firstWhere(
                                    (element) =>
                                        element['HospitalName'] ==
                                        selectedHospital)['HospitalId'];
                                detail.doctorName = value.toString();
                                detail.address = listHealth[0].firstWhere(
                                    (element) =>
                                        element['HospitalName'] ==
                                        hospitalName)['Address'];

                                doctorName = updateDoctor(
                                    detail.hospitalId, detail.doctorSpec);
                              });
                            },
                          ),
                        ),
                      //! Doctor Name
                      const SizedBox(
                        height: 25,
                      ),
                      AppTiitleText(
                        tittle: AppLocalizations.of(context)!.translate78,
                        fontweight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (doctorName.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    spreadRadius: 0.5,
                                    offset: const Offset(2, 05),
                                    color: const Color.fromRGBO(0, 0, 0, 1)
                                        .withOpacity(0.1),
                                  )
                                ],
                              ),
                              child: DropdownMenu(
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  border: InputBorder.none,
                                ),
                                dropdownMenuEntries: doctorName
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                    value: value,
                                    label: value,
                                  );
                                }).toList(),
                                hintText:
                                    AppLocalizations.of(context)!.translate81,
                                // initialSelection: specialities[0],

                                // initialSelection: listHealth[0]['HospitalName'],
                                textStyle: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff666666),
                                ),
                                trailingIcon: Image.asset(
                                  "assets/icons/chevron.png",
                                  width: 10,
                                  height: 10,
                                  color: Colors.black,
                                ),

                                selectedTrailingIcon: Image.asset(
                                  "assets/icons/up_arrow.png",
                                  width: 10,
                                  height: 10,
                                  color: Colors.black,
                                ),
                                width: ScreenSize.width(context) -
                                    (AppDimension().screenContaintPadding * 2),

                                onSelected: (value) {
                                  setState(() {
                                    detail.doctorName = value.toString();
                                    detail.doctorId = listHealth[1].firstWhere(
                                        (element) =>
                                            element['HospitalId'] ==
                                                detail.hospitalId &&
                                            element['DoctorName'] ==
                                                detail.doctorName)['DoctorId'];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  )
                else
                  const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 151, 142, 177),
                    ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
