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
      profile: "assets/plant-8203430_1280.png"),
  DoctorModel(
      name: "Mary Wahome",
      position: "Psychiatrist",
      averageReview: 4.5,
      totalReview: 205,
      profile: "assets/ai-generated-8309224_1280.png"),
  DoctorModel(
      name: "Dr. Scott Mohammed",
      position: "Psychologist",
      averageReview: 4.2,
      totalReview: 180,
      profile: "assets/toddler-8297939_1280.jpg")
];
