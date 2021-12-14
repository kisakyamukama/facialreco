class UserDetails {
  String firstName;
  String lastName;
  String email;
  String gender;
  String department;
  String company;

  UserDetails({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.department,
    required this.company,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        gender: json['gender'],
        company: json['company'],
        department: json['department']);
  }
}
