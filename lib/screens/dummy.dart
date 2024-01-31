import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:alphanum_comparator/alphanum_comparator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:patientapp/Models/appointment.dart';
import 'package:patientapp/Models/logindetail.dart';
import 'package:patientapp/widgets/textfield.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/date_symbol_data_local.dart';

class dummyData extends StatefulWidget {
  const dummyData({super.key});

  @override
  State<dummyData> createState() => _dummyDataState();
}

class dailySchedule {
  final int dId;
  final String day;
  final String image;

  const dailySchedule(
      {required this.dId, required this.day, required this.image});
}

class _dummyDataState extends State<dummyData> {
  List<dailySchedule> schedule = [
    dailySchedule(
        dId: 0,
        day: 'Monday',
        image:
            'https://ih1.redbubble.net/image.467902823.2780/flat,750x,075,f-pad,750x1000,f8f8f8.u5.jpg'),
    dailySchedule(
        dId: 1,
        day: 'Tuesday',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Letter_T.png?20170930195759'),
    dailySchedule(
        dId: 2,
        day: 'Wednesday',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1O9kGHuas9PED3-hbRV0xkmWDYCBcLRbhlOitEY0fBw&s'),
    dailySchedule(
        dId: 3,
        day: 'Thursday',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Letter_T.png?20170930195759'),
    dailySchedule(
        dId: 4,
        day: 'Friday',
        image:
            'https://dearsam.com/img/600/744/resize/t/h/the-letter-f-50x70_3a189.jpg'),
    dailySchedule(
        dId: 5,
        day: 'Saturday',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Unicode_0x0053.svg/800px-Unicode_0x0053.svg.png'),
    dailySchedule(
        dId: 6,
        day: 'Sunday',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Unicode_0x0053.svg/800px-Unicode_0x0053.svg.png')
  ];
  final TextEditingController _docname = TextEditingController();
  final TextEditingController _speciality = TextEditingController();
  final TextEditingController _sttime = TextEditingController();
  final TextEditingController _endtime = TextEditingController();
  final TextEditingController _days = TextEditingController();

  @override
  void initState() {
    _docname.clear();
    _speciality.clear();

    super.initState();
    healthDates();
    getHealthpost(); // Call getHealthpost in initState
  }

  final listHealth = <String>[];
  final Map<String, String> listHealthaddress = HashMap();
  final daySelect = HashSet<int>();

  String hospitalName = '';

  void healthDates() {
    String currentday = DateFormat.EEEE().format(DateTime.now()).toString();
    List<dailySchedule> temp = <dailySchedule>[];

    var item = schedule.firstWhere((i) => i.day == currentday);
    //var index = schedule.indexWhere((i) => i.day == currentday);

    if (item.dId == 0) {
      temp = schedule;
    } else {
      temp = schedule.getRange(item.dId, schedule.length).toList();
      temp = temp.followedBy(schedule.getRange(0, item.dId)).toList();
    }
    schedule = temp;
  }

  Future<void> updateAppointment() async {
    List<String> starttime = _sttime.text.split(':');
    List<String> endtime = _endtime.text.split(':');
    DateTime currenttime = DateTime.now();
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    int hours = int.tryParse(starttime[0]) ?? 0;
    int minutes = int.tryParse(starttime[1]) ?? 0;
    TimeOfDay selectedstartTime = TimeOfDay(hour: hours, minute: minutes);

    hours = int.tryParse(endtime[0]) ?? 0;
    minutes = int.tryParse(endtime[1]) ?? 0;
    TimeOfDay selectedendTime = TimeOfDay(hour: hours, minute: minutes);

    DateTime start = DateTime(currenttime.year, currenttime.month,
        currenttime.day, selectedstartTime.hour, selectedstartTime.minute);

    DateTime end = DateTime(currenttime.year, currenttime.month,
        currenttime.day, selectedendTime.hour, selectedendTime.minute);

    final listdates = <DateTime>[start];
    bool finished = false;
    DateTime current = start;

    while (!finished) {
      current = current.add(const Duration(minutes: 30));
      if (current.isAfter(end)) {
        finished = true;
        break;
      }
      listdates.add(current);
    }

    int weeks = int.tryParse(_days.text.toString()) ?? 0;

    for (int i = 0; i < weeks; i++) {
      for (var j in daySelect) {
        for (int k = 0; k < listdates.length; k++) {
          Logindetail patien = const Logindetail(
              phonenumber: null,
              name: null,
              dob: null,
              email: null,
              uid: null,
              docid: '00000');

          AppointmentBlockModel appoint = AppointmentBlockModel(
              detail: patien,
              checkedIn: false,
              doctorid: '00000',
              doctorspeciality: _speciality.text,
              hospitalname: hospitalName,
              day: DateTime(listdates[k].year, listdates[k].month,
                  (listdates[k].day + j), 0, 0, 0),
              aptStarttime: listdates[k].add(Duration(days: ((7 * i) + j))),
              aptEndtime:
                  listdates[k].add(Duration(days: ((7 * i) + j), minutes: 30)),
              dayId: start.add(Duration(days: ((7 * i) + j))),
              weekId: start.add(Duration(days: ((7 * i)))),
              confcode: null,
              userID: 'vishnu');

          try {
            await _firestore
                .collection('Appointments')
                .doc(Uuid().v1())
                .set(appoint.toJson());
          } catch (error) {
            print(error);
          }
        }
      }
    }
  }

  Future<void> getHealthpost() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var healthPost =
        await _firestore.collection('Hospitals').orderBy('HospitalName').get();

    for (int i = 0; i < healthPost.docs.length; i++) {
      listHealth.add((healthPost.docs[i].data()['HospitalName']));
      listHealthaddress.addAll({
        healthPost.docs[i].data()['HospitalName']:
            (healthPost.docs[i].data()['Address']['Street'] +
                '\n' +
                healthPost.docs[i].data()['Address']['Region'] +
                '\n' +
                healthPost.docs[i].data()['Address']['City'])
      });
    }
    listHealth.sort(AlphanumComparator.compare);
    if (listHealth.isNotEmpty) {
      // Set the initial hospitalName if the list is not empty
      hospitalName = listHealth[0];
    }
    // You can update the UI after loading data if needed
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Enter Hospital Name'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DropdownMenu(
                dropdownMenuEntries:
                    listHealth.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
                initialSelection: hospitalName,
                width: 330,
                onSelected: (value) {
                  setState(() {
                    hospitalName = value.toString();
                  });
                },
              ),
            ),
            TextFieldInput(
                textEditingController: _docname,
                hint: 'Enter Doctor Name',
                textInputType: TextInputType.name,
                error: 'Please enter Name',
                clicked: false),
            TextFieldInput(
                textEditingController: _speciality,
                hint: 'Enter Speciality',
                textInputType: TextInputType.name,
                error: 'Please enter Speciality',
                clicked: false),
            Container(
              height: 80, // Reduce the height to fit all 7 tiles
              child: ListView(
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal
                children: List.generate(schedule.length, (index) {
                  final option = schedule[index];
                  return Container(
                    width: 35, // Set a fixed width for each circular tile
                    margin: EdgeInsets.all(8.0), // Add margin for spacing
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          100.0,
                        ),
                        side: BorderSide(
                          color: daySelect.contains(index)
                              ? Colors.blue
                              : Colors
                                  .transparent, // Add a border to indicate selection
                          width: 2.0,
                        ), // Make the card circular
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            int day = index;
                            if (daySelect.contains(day)) {
                              daySelect.remove(day);
                            } else {
                              daySelect.add(day);
                            }
                            print(daySelect);
                          });
                        },
                        highlightColor: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 25, // Set a width for the image container
                              height:
                                  25, // Set a height for the image container
                              decoration: BoxDecoration(
                                shape:
                                    BoxShape.circle, // Make the image circular
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(option.image),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Adjust the spacing between the image and text
                            /*  Text(
                              option.day,
                              style: TextStyle(
                                fontSize:
                                    16.0, // Reduce the font size for smaller circles
                                fontWeight: FontWeight.bold,
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: 150, // Set the width of the first TextField
                  child: TextField(
                    controller: _sttime,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Start Time', // Custom label text
                      enabled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              1))), // Remove the default input border
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 150, // Set the width of the second TextField
                  child: TextField(
                    controller: _endtime,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        labelText: 'End time', // Custom label text
                        enabled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                1))) // Remove the default input border
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150, // Set the width of the second TextField
              child: TextField(
                controller: _days,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Number of Weeks', // Custom label text
                    enabled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            1))) // Remove the default input border
                    ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: () {
                  updateAppointment();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 60),
                    primary: Color.fromARGB(200, 8, 65, 10)),
                child: Text('Add data')),
          ],
        ),
      ),
    );
  }
}
