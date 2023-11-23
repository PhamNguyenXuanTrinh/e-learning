

import '../../core/resources/data_state.dart';
import '../models/notification_model.dart';

abstract class NotificationRepository {
  Future<DataState<List<NotificationModel>?>> getNotifications();
}