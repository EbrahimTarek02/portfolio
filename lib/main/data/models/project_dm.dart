import 'package:portfolio/helpers/app_assets.dart';

class ProjectDm {
  final String image;
  final String title;
  final String description;
  final String? googlePlay;
  final String? appStore;
  final String? github;
  final List<String> technologies;
  /// Firebase
  /// Payment
  /// Maps
  /// APIs
  /// Localization
  /// Notification

  const ProjectDm({
    required this.image,
    required this.title,
    required this.description,
    required this.technologies,
    this.googlePlay,
    this.appStore,
    this.github});

  static const List<ProjectDm> projects = [
    ProjectDm(
        image: AppAssets.oscarProjectImage,
        title: "Oscar Grand Stores App",
        description: "Oscar Grand Stores is a grocery shopping app.",
        googlePlay: "https://play.google.com/store/apps/details?id=com.zazome.oscarstore",
        appStore: "https://apps.apple.com/eg/app/oscar-grand-stores/id6747345648",
        technologies: ["APIs", "Payment", "Localization", "Firebase", "Notifications", "Maps"]
    ),

    ProjectDm(
      image: AppAssets.imtenanProjectImage,
      title: "Imtenan App",
      description: "Imtenan is an e-commerce app offering premium honey and healthy food.",
      googlePlay: "https://play.google.com/store/apps/details?id=com.zazome.test",
      appStore: "https://apps.apple.com/eg/app/imtenan/id6746721189",
      technologies: ["APIs", "Payment", "Localization"]
    ),

    ProjectDm(
      image: AppAssets.eCommerceProjectImage,
      title: "E-commerce App",
      description: "A Flutter e-commerce app offering a seamless and engaging shopping experience with intuitive navigation, real-time product updates, and secure payment options.",
      github: "https://github.com/EbrahimTarek02/e_commerce",
      technologies: ["APIs", "Payment", "Maps"]
    ),

    ProjectDm(
      image: AppAssets.moviesProjectImage,
      title: "Movies App",
      description: "A Flutter Movies app providing an immersive experience with up-to-date film information, trailers, reviews, and personalized recommendations for movie enthusiasts.",
      github: "https://github.com/EbrahimTarek02/movies_app",
      technologies: ["APIs", "Firebase"]
    ),

    ProjectDm(
        image: AppAssets.islamiProjectImage,
        title: "Islami App",
        description: "Islami is a project offering Quran and Ahadeeth reading, Sebha counting, and Islamic radio streaming.",
        github: "https://github.com/EbrahimTarek02/islami",
        technologies: ["APIs", "Localization"]
    )
  ];
}