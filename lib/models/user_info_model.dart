class UserInfo {
  final String name;
  final int age;
  final String gender;
  final String profession;
  final String area;
  final double? weight;
  final double? height;

  UserInfo({
    required this.name,
    required this.age,
    required this.gender,
    required this.profession,
    required this.area,
    this.weight,
    this.height,
  });
}
