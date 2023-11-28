class StudentModel {
  final String name;
  final String position;
  final double averageReview;
  final int totalReview;
  final String profile;

  StudentModel(
      {required this.name,
      required this.position,
      required this.averageReview,
      required this.totalReview,
      required this.profile});
}

List<StudentModel> studentModel = [
  StudentModel(
      name: "Catherine Njeri",
      position: "Student",
      averageReview: 3.5,
      totalReview: 202,
      profile: "assets/sad-2042536_1280.jpg"),
  StudentModel(
      name: "Charles Ndombi",
      position: "Student",
      averageReview: 4.5,
      totalReview: 205,
      profile: "assets/portrait-3416680_1280.jpg"),
  StudentModel(
      name: "James Kindiki",
      position: "Student",
      averageReview: 4.2,
      totalReview: 180,
      profile: "assets/male-2101801_1280.jpg")
];
