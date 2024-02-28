
class ChatroomModel {
  final String name;
  final List<String> members;
  final String topic;
  final List<String> messages;
  final DateTime createdAt;

  ChatroomModel({
    required this.name,
    required this.members,
    required this.topic,
    required this.messages,
    required this.createdAt,
  });
}
