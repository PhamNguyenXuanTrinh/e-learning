import 'package:elearning/src/domain/models/notification_model.dart';
import 'package:elearning/src/presentation/bloc/notification/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elearning/src/core/utils/constants/strings.dart';

import '../../../domain/models/message_model.dart';

import '../../../injector/injector.dart';
import '../../bloc/message/message_bloc.dart';
import 'widget_notification/items_mesagge.dart';
import 'widget_notification/items_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MessageBloc>(
            create: (context) => getIt<MessageBloc>()..add(MessageStarted()),
          ),
          BlocProvider<NotificationBloc>(
            create: (context) =>
                getIt<NotificationBloc>()..add(NotificationStarted()),
          ),
        ],
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              automaticallyImplyLeading: false,
              title: const Text(
                AppStrings.notifications,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Text(AppStrings.message),
                  ),
                  Tab(
                    icon: Text(AppStrings.notifications),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                BlocBuilder<MessageBloc, MessageState>(
                  builder: (context, state) {
                    if (state is MessageLoadSuccess) {
                      return _buildItemsMess(context, state.message);
                    } else if (state is MessageInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is MessageLoadFailure) {
                      return const Center(
                        child: Text(AppStrings.error),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    if (state is NotificationLoadSuccess) {
                      return _buildNotifications(context, state.notification);
                    } else if (state is NotificationInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is NotificationLoadFailure) {
                      return const Center(
                        child: Text(AppStrings.error),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _buildNotifications(
    BuildContext context, List<NotificationModel>? notifications) {
  return ListView.builder(
      itemCount: notifications?.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        NotificationModel? notification = notifications?[index];
        return SizedBox(
          child: ItemsNotificationWidget(
            content: notification?.content ?? '',
            imageUrl: notification?.imageUrl ?? '',
            time: notification?.time ?? '',
          ),
        );
      });
}

Widget _buildItemsMess(BuildContext context, List<MessageModel>? messages) {
  return ListView.builder(
    itemCount: messages?.length,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    itemBuilder: (context, index) {
      MessageModel? message = messages?[index];
      return ItemsMessageWidget(
          name: message?.name ?? '',
          time: message?.time ?? '',
          status: message?.status ?? '',
          imgUrl: message?.imgUrl ?? '',
          des: message?.des ?? '',
          imgUser: message?.imgUser ?? '');
    },
  );
}
