import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elearning/src/core/utils/constants/strings.dart';

import '../../../domain/models/message_model.dart';

import '../../../injector/injector.dart';
import '../../bloc/message/message_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MessageBloc>()..add(MessageStarted()),
      child: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          if (state is MessageLoadSuccess) {
            return DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    _buildItemsMess(context, state.message),
                    _buildNotifications(context),
                  ],
                ),
              ),
            );
          } else if (state is MessageInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MessageLoadFailure) {
            return const Center(
              child: Text('Error',),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

Widget _buildNotifications(BuildContext context) {
  return ListView(
    children: const [
      ListTile(
        title: Text('Notification 1'),
      ),
      ListTile(
        title: Text('Notification 2'),
      ),
      // Add more list items as needed
    ],
  );
}

Widget _buildItemsMess(BuildContext context, List<MessageModel>? messages) {
  return ListView.builder(
    itemCount: messages?.length,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    itemBuilder: (context, index) {
      MessageModel? message = messages?[index];
      return _ItemsMessageWidget(
          name: message?.name ?? '',
          time: message?.time ?? '',
          status: message?.status ?? '',
          img_url: message?.img_url ?? '',
          des: message?.des ?? '',
          img_user: message?.img_user ?? '');
    },
  );
}

class _ItemsMessageWidget extends StatefulWidget {
  final String name;
  final String time;
  final String status;
  final String img_url;
  final String des;
  final String img_user;
  const _ItemsMessageWidget({
    super.key,
    required this.name,
    required this.time,
    required this.status,
    required this.img_url,
    required this.des,
    required this.img_user,
  });

  @override
  State<_ItemsMessageWidget> createState() => _ItemsMessageWidgetState();
}

class _ItemsMessageWidgetState extends State<_ItemsMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(widget.img_user),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.name),
                    Text(widget.status),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Text(
                  widget.time,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.des),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(widget.img_url),
        ],
      ),
    );
  }
}
