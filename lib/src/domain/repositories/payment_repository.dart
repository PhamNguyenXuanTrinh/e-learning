import '../../core/resources/data_state.dart';
import '../models/payment_model.dart';

abstract class PaymentRepository {
  Future<DataState<PaymentModel>?> getPayments();
}
