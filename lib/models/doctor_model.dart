class DoctorModel {
  final String name;
  final String position;
  final double averageReview;
  final int totalReview;
  final String profile;

  DoctorModel(
      {required this.name,
      required this.position,
      required this.averageReview,
      required this.totalReview,
      required this.profile});
}

List<DoctorModel> nearbyDoctors = [
  DoctorModel(
      name: "Dr. Skylar krushan",
      position: "Therapist",
      averageReview: 3.5,
      totalReview: 202,
      profile: "assets/dentist-1191671_1280.jpg"),
  DoctorModel(
      name: "Dr. Mary Wahome",
      position: "Psychiatrist",
      averageReview: 4.5,
      totalReview: 205,
      profile: "assets/doctor-2337835_1280.jpg"),
  DoctorModel(
      name: "Dr. Scott Mohammed",
      position: "Psychologist",
      averageReview: 4.2,
      totalReview: 180,
      profile: "assets/woman-216988_1280.jpg")
];
