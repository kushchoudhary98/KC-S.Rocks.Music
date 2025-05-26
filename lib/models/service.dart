class ServiceModel {
  final String title;
  final String description;
  final String icon;
  final String routeName;

  ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.routeName
  });

  factory ServiceModel.fromMap(Map<String, dynamic> data) {
    return ServiceModel(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '1',
      routeName: data['route'] ?? '',
    );
  }
}
