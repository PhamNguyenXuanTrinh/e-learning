import 'package:flutter/material.dart';

class ItemsMessageWidget extends StatefulWidget {
  final String name;
  final String time;
  final String status;
  final String imgUrl;
  final String des;
  final String imgUser;
  const ItemsMessageWidget({
    super.key,
    required this.name,
    required this.time,
    required this.status,
    required this.imgUrl,
    required this.des,
    required this.imgUser,
  });

  @override
  State<ItemsMessageWidget> createState() => ItemsMessageWidgetState();
}

class ItemsMessageWidgetState extends State<ItemsMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.48,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).cardColor.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    widget.imgUser,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.status,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      widget.time,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                      ),
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
              Image.asset(
                widget.imgUrl,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
