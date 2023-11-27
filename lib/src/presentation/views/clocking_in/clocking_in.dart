import 'package:elearning/src/domain/models/clock_model.dart';
import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constants/strings.dart';
import '../../../injector/injector.dart';
import '../../bloc/clock/clock_bloc.dart';

Widget buildBtn(BuildContext context) {
  return BlocProvider(
      create: (context) => getIt<ClockBloc>()..add(ClockStarted()),
      child: BlocBuilder<ClockBloc, ClockState>(builder: (context, state) {
        if (state is ClockLoadSuccess) {
          return Center(
            child: PrimaryBtn(
              text: AppStrings.startLearning,
              onTap: () {
                showClockingInDialog(context, state.clock);
              },
            ),
          );
        } else if (state is ClockLoadFailure) {
          return Center(
            child: Text('${AppStrings.error} : ${state.apiError.message}'),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }));
}

void showClockingInDialog(BuildContext context, ClockModel? clock) {
  int selectedCount = clock?.week ?? 0;
  List<String> buttonLabels = ["1", "2", "3", "4", "5", "6", "7"];
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SimpleDialog(
            contentPadding: const EdgeInsets.all(20.0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(AppStrings.clocking),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  AppStrings.goodJob,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.learned,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text((clock?.learned ?? '').toString()),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              AppStrings.min,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.totallyHours,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text((clock?.totalHours ?? '').toString()),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              AppStrings.hsr,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text((clock?.totalDay ?? '').toString()),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      AppStrings.day,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    buttonLabels.length,
                    (index) => InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < selectedCount
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).cardColor,
                        ),
                        child: Center(
                          child: Text(
                            buttonLabels[index],
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(AppStrings.record),
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryBtn(
                  text: AppStrings.share,
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
                child: Icon(Icons.close,
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
          ),
        ],
      );
    },
  );
}
