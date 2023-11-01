class BookedApponmtModel {
  String? appointmenyTime;
  String? location;
  String? visitedBy;
  String? appointmentFor;
  String? confirmationCode;

  BookedApponmtModel({
    required this.appointmenyTime,
    required this.location,
    required this.visitedBy,
    required this.appointmentFor,
    required this.confirmationCode,
  });
}

List<BookedApponmtModel> upcomingAppointList = [
  BookedApponmtModel(
    appointmenyTime: "3:00 PM,  18 Dec 2023",
    location: "Hospital General De Grand Yoff",
    visitedBy: "Cardiologist",
    appointmentFor: "Hospital General De Grand Yoff",
    confirmationCode: "Confirmation Code:   XYAS345",
  ),
  BookedApponmtModel(
    appointmenyTime: "3:00 PM,  24 Dec 2023",
    location: "Hospital General De Grand Yoff",
    visitedBy: "General",
    appointmentFor: "Patient-name-01",
    confirmationCode: "Confirmation Code:   XYAS123",
  ),
  BookedApponmtModel(
    appointmenyTime: "3:00 PM,  18 Dec 2023",
    location: "Hospital General De Grand Yoff",
    visitedBy: "Cardiologist",
    appointmentFor: "Hospital General De Grand Yoff",
    confirmationCode: "Confirmation Code:   XYAS345",
  ),
  BookedApponmtModel(
    appointmenyTime: "3:00 PM,  24 Dec 2023",
    location: "Hospital General De Grand Yoff",
    visitedBy: "General",
    appointmentFor: "Patient-name-01",
    confirmationCode: "Confirmation Code:   XYAS123",
  ),
];
