class AppUser {
  int? id;
  String name;
  String email;
  String city;
  String hobbies;
  String gender;
  String num;
  int age;
  String pass;
  String religion;
  String qualification;
  String occupation;
  bool isFavorite; // ✅ Change from int to bool

  AppUser({
    this.id,
    required this.name,
    required this.email,
    required this.city,
    required this.hobbies,
    required this.gender,
    required this.num,
    required this.age,
    required this.pass,
    required this.religion,
    required this.qualification,
    required this.occupation,
    this.isFavorite = false, // ✅ Default value
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] ?? 0,
      name: map['name'] ?? 'Default',
      email: map['email'] ?? 'abc@gmail.com',
      city: map['city'] ?? 'Morvi',
      hobbies: map['hobbies'] ?? 'Travelling',
      gender: map['gender'] ?? 'Female',
      num: map['num'] ?? '1234567890',
      age: map['age'] ?? 0,
      pass: map['pass'] ?? 'abcdefg',
      religion: map['religion'] ?? 'Hinduism',
      qualification: map['qualification'] ?? 'Postgraduate',
      occupation: map['occupation'] ?? 'Student',
      isFavorite: map['isFavorite'] == 1,
    );
  }

  // ✅ Modify toMap() function to store boolean as int
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'city': city,
      'hobbies': hobbies,
      'gender': gender,
      'num': num,
      'age': age,
      'pass': pass,
      'religion': religion,
      'qualification': qualification,
      'occupation': occupation,
      'isFavorite': isFavorite ? 1 : 0,  // ✅ Convert boolean to integer
    };
  }
}