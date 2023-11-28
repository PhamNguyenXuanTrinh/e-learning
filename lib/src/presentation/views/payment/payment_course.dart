import 'package:elearning/src/presentation/views/payment/payment_successful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/utils/constants/imgs.dart';
import '../../../core/utils/constants/strings.dart';
import '../../../domain/models/payment_model.dart';
import '../../../injector/injector.dart';
import '../../bloc/payment_bloc/payment_bloc.dart';
import '../../widgets/btn_primary_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.paymentMethod),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
      ),
      body: const Center(
        child: BodyTab(),
      ),
    );
  }
}

class BodyTab extends StatelessWidget {
  const BodyTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (context) => getIt<PaymentBloc>()..add(PaymentStarted()),
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is PaymentLoadSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: _Buildconfirm(context, state.payment),
              );
            } else if (state is PaymentLoadFailure) {
              return Center(
                child: Text('${AppStrings.error} : ${state.apiError.message}'),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget _Buildconfirm(BuildContext context, PaymentModel? payment) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            (payment?.moneyCourse ?? 0).toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          CreditCardWidget(
            amount: ((payment?.bankCard ?? 0).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: PrimaryBtn(
              text: AppStrings.payNow,
              onTap: () {
                _showBottomSheet(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                AppStrings.paymentPassword,
                style: TextStyle(fontSize: 18.0),
              ),
              const Text(
                AppStrings.enterPayment,
                style: TextStyle(fontSize: 12.0),
              ),
              const SizedBox(
                height: 10,
              ),
              OtpTextField(
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  if (verificationCode == '11111') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentSuccess(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text(AppStrings.wrong),
                          content: Text(AppStrings.reenter),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        );
      },
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final String amount;

  const CreditCardWidget({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          AppImages.imgCreditCard,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Text(
            amount,
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor, 
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
