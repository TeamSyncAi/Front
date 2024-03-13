class User {
  //final String id;
  final String? username; 
  final String? email;
  final String? numTel;
  final String? password; 
  final String? role; 
  final bool termsAccepted; 

  const User({
    //required this.id,
    required this.username,
    required this.email,
    required this.numTel,
    required this.password, 
    this.role = 'Client', 
    required this.termsAccepted, 
  });

  factory User.fromJson(Map<String, dynamic> json) {
  
    final String role = json['role']?.toLowerCase() ?? 'Client'; 
    final validRoles = ['teamleader', 'Client'];
    final selectedRole = validRoles.contains(role) ? role : 'Client';

    return User(
      //id: json['id'],
      username: json['username'],
      email: json['email'],
      numTel: json['numTel'],

      password: json['password'],
      role: selectedRole,
      termsAccepted: json['termsAccepted'] ?? false, 
    );
  }
}