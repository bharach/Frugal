import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';

class FirestoreAppoint {
  ////////////////////////////////////
  /// Firestore Snippets
  ////////////////////////////////////

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Uint32List data = Uint32List.fromList([0, 4027580400, 65535]);

  String date = '2023-11-'; // Example byte data

  List<DateTime> printAvailability(Uint32List bitmap, DateTime dated) {
    List<DateTime> startTimes = [];

    for (int j = 0; j < bitmap.length; j++) {
      for (int i = 0; i < 31; i++) {
        if (((bitmap[j] & (1 << i)) != 0) &&
            ((bitmap[j] & (1 << (i + 1))) != 0)) {
          if (i % 2 == 0) {
            int minutes = ((j * 32) + i) * 15;
            DateTime startTime = DateTime(dated.year, dated.month, dated.day,
                minutes ~/ 60, minutes % 60);
            startTimes.add(startTime);
          }
        }
      }
    }
    return startTimes;
  }

  Future<List<DateTime>> getAvailabilities(
      {required String hospitalid,
      required String doctorid,
      required DateTime datetime}) async {
    List<DateTime> startTimes = [];
    try {
      var doc = await _firestore
          .collection('Hospitals')
          .doc(hospitalid)
          .collection('Doctors')
          .doc(doctorid)
          .get();

      if (doc.exists) {
        final data = doc.data();
        final availabilities = data?['Availabilities'];
        final date = datetime.toString().substring(0, 10);
        // DateTime dated = DateTime.parse(datetime);
        final available = availabilities?[date];

        if (available != null && available is List<dynamic>) {
          List<int> intList = available.map((item) => item as int).toList();
          Uint32List bitmap = Uint32List.fromList(intList);
          startTimes = printAvailability(bitmap, datetime);
        }
      }
      // Return the list of DateTime objects
    } catch (e) {
      rethrow;
    }

    return startTimes;
  }

  Future<bool> setUnavailable(hospitalid, doctorid, datetime) async {
    bool done = false;
    var doc = await _firestore
        .collection('Hospitals')
        .doc(hospitalid)
        .collection('Doctors')
        .doc(doctorid)
        .get();
    if (doc.exists) {
      final data = doc.data();
      final availabilities = data?['Availabilities'];
      final date = datetime.toString().substring(0, 10);
      final available = availabilities?[date];

      if (available != null && available is List<dynamic>) {
        List<int> intList = available.map((item) => item as int).toList();
        Uint32List bitmap = Uint32List.fromList(intList);
        // printAvailability(bitmap);
        int start = 0;
        int end = 0;
        if (datetime.minute == 30) {
          start = datetime.hour * 4 + 1;
          end = start + 2;
        } else {
          start = datetime.hour * 4;
          end = start + 2;
        }
        if (checkAvailability(bitmap, start + 1, end + 1)) {
          setUnavailability(bitmap, start + 1, end + 1);
          _firestore
              .collection('Hospitals')
              .doc(hospitalid)
              .collection('Doctors')
              .doc(doctorid)
              .set({
            'Availabilities': {date: bitmap},
          }, SetOptions(merge: true)).then((_) {
            done = true;
            print("Availability added");
          }).catchError((error) {
            print("Failed to add availability: $error");
          });
        }
      }
    }
    return done;
  }

  bool checkAvailability(Uint32List bitmap, int startSlot, int endSlot) {
    // Check if all the slots in the specified range are available
    for (int i = startSlot; i <= endSlot; i++) {
      int arrayIndex = i ~/ 32;
      int bitIndex = i % 32;

      if ((bitmap[arrayIndex] & (1 << bitIndex)) == 0) {
        // Slot is not available
        return false;
      }
    }

    // All slots are available
    return true;
  }

  void setUnavailability(Uint32List bitmap, int startSlot, int endSlot) {
    // Calculate the bit positions for the start and end slots
    int startIndex = startSlot ~/ 32;
    int endIndex = endSlot ~/ 32;
    int bitIndex = startSlot % 32;
    int totalBits = endSlot - startSlot;
    int bitCount = 0;

    for (int i = startIndex; i <= endIndex; i++) {
      for (; bitCount < totalBits && bitIndex < 32; bitCount++, bitIndex++) {
        bitmap[i] &= ~(1 << bitIndex);
      }
      bitIndex = 0;
    }
  }
}
