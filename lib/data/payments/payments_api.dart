import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../models/payments/payment.dart';

@lazySingleton
class PaymentsAPI {
  final featurePath = '/paymentMethod';

  Future<List<PaymentMethod>> getAppPaymets() async {
    final response =
        await DioFactory.dio.get<Map<String, dynamic>>('/getAllPaymentMethods');

    return (response.data! as List)
        .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

/*
{
  "appointmentDate": "2023-02-19T06:39:49.648380",
  "clinicId": 5,
  "patientId": 61,
  "time": 3.18,
  "priceId": 21,
  "cancelled": false,
  "finish": true,
  "numPatient": 0,
  "nurseId": 62,
  "pay": false,
  "paymentId":1
}
 */