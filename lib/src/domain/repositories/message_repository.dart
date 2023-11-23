import '../../core/resources/data_state.dart';
import '../models/message_model.dart';

abstract class MessageRepository {
  Future<DataState<List<MessageModel>?>> getMessages();
}