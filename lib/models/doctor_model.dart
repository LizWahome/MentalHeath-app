class DoctorModel {
  final String name;
  final String position;
  final double averageReview;
  final int totalReview;
  final String profile;
  final String about;

  DoctorModel(
      {required this.name,
      required this.position,
      required this.averageReview,
      required this.totalReview,
      required this.about,
      required this.profile});
}

List<DoctorModel> nearbyDoctors = [
  DoctorModel(
      name: "Dr. Nkono Mkono",
      position: "Therapist",
      averageReview: 3.5,
      totalReview: 202,
      profile: "assets/doctor-2337835_1280.jpg",
      about: "Dr. Nkono Mkono is a dedicated therapist at the Technical University of Mombasa, bringing a wealth of experience and compassion to his practice. With a background in clinical psychology, Dr. Mkono specializes in cognitive-behavioral therapy and has a deep commitment to helping individuals navigate life's challenges. Known for his warm demeanor and patient-centered approach, he is passionate about empowering his clients to achieve holistic well-being."),
  DoctorModel(
      name: "Dr. Mary Ayubu",
      position: "Psychiatrist",
      averageReview: 4.5,
      totalReview: 205,
      profile: "assets/dentist-1191671_1280.jpg",
      about: "As a seasoned therapist at the Technical University of Mombasa, Dr. Mary Ayubu is a beacon of support for those seeking mental health assistance. Dr. Ayubu holds expertise in family therapy and interpersonal relationships, fostering an inclusive and nurturing environment for her clients. Her commitment to creating a safe space for open dialogue and healing reflects her belief in the transformative power of therapy in promoting emotional resilience and personal growth."),
  DoctorModel(
      name: "Dr. Scott Mohammed",
      position: "Psychologist",
      averageReview: 4.2,
      totalReview: 180,
      profile: "assets/woman-216988_1280.jpg",
      about: "Dr. Scott Mohammed is a respected therapist at the Technical University of Mombasa, specializing in stress management and mindfulness-based interventions. With a background in counseling psychology, Dr. Mohammed is dedicated to helping individuals develop coping strategies to navigate life's complexities. His approach combines evidence-based techniques with a personalized touch, creating a supportive atmosphere for his clients to explore their emotional well-being and enhance their overall quality of life.")
];
