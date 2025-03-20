class ExperienceDm {
  final String companyName;
  final String role;
  final String date;

  const ExperienceDm({required this.companyName, required this.role, required this.date});

  static const List<ExperienceDm> experienceList = [
    ExperienceDm(companyName: "Zazome", role: "Junior Flutter Developer", date: "November 2024 - Present"),
    ExperienceDm(companyName: "ABS.AI Technologies", role: "Flutter Internship", date: "July 2024 - October 2024"),
    ExperienceDm(companyName: "Route Academy", role: "Flutter Course", date: "October 2023 - January 2024"),
    ExperienceDm(companyName: "Google Developer Student Club (GDSC)", role: "Flutter Training", date: "September 2023 - October 2023"),
  ];
}