class User {
  final String id;
  final String name; 
  final String email;
  final String password; 
  final String role; 
  final bool termsAccepted; 

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password, 
    this.role = 'Client', 
    required this.termsAccepted, // Now required
  });

  factory User.fromJson(Map<String, dynamic> json) {
  
    final String role = json['role']?.toLowerCase() ?? 'Client'; // Ensure case-insensitive match
    final validRoles = ['teamleader', 'Client'];
    final selectedRole = validRoles.contains(role) ? role : 'Client';

    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: selectedRole,
      termsAccepted: json['termsAccepted'] ?? false, // Default to false if not provided
    );
  }
}