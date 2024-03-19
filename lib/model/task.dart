class Task {
  final String taskTitle;
  final String taskDescription;
  final DateTime date;
  final List<Member> members;

  Task({
    required this.taskTitle,
    required this.taskDescription,
    required this.date,
    required this.members,
  });
}

class Member {
  final String name;
  final String email;
  final List<String> profileImagePath; // Keep as a list

  Member({
    required this.name,
    required this.email,
    required this.profileImagePath,
  });
}