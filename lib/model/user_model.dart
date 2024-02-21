class User {
  final String id;
  final String name; // Changed from 'username' to 'name' to match the form field
  final String email;
  final String password; // Added to store the password
  final String role; // This remains the same ('teamLeader' or 'guest')
  final bool termsAccepted; // Added to store the status of terms & policy checkbox

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password, // Now required
    this.role = 'guest', // Default value is 'guest'
    required this.termsAccepted, // Now required
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Ensure that the role is either 'teamleader' or 'guest'
    final String role = json['role']?.toLowerCase() ?? 'guest'; // Ensure case-insensitive match
    final validRoles = ['teamleader', 'guest'];
    final selectedRole = validRoles.contains(role) ? role : 'guest';

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