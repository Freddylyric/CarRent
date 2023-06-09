

class UserModel{
  final String? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String? imageUrl;
  final String? role;
  final String? createdAt;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
     this.imageUrl,
     this.role,
    required this.createdAt,
  });


  toJson(){
    return {

      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'imageUrl': imageUrl,
      'role': role,
      'createdAt': createdAt,

    };
  }

}


