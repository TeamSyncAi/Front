import 'package:scoped_model/scoped_model.dart';
import 'package:teamsyncai/model/message_model.dart';
import 'package:teamsyncai/services/message_service.dart';


class MessageProvider extends Model {
  final MessageService messageService = MessageService();

  void init() {
    messageService.init();
  }

  void sendMessage(String text, String receiverChatID) {
    messageService.sendMessage(text, receiverChatID);
    notifyListeners();
  }

  List<Message> getMessagesForChatID(String chatID) {
    return messageService.getMessagesForChatID(chatID);
  }
}
