import 'package:bimarestan/core/apis/api_utils.dart';
import 'package:injectable/injectable.dart';

import '../../models/patient_analyzes/send_analyzes_request.dart';

@lazySingleton
class PatientAnalyzesAPI {
  Future<void> sendAnalyzes(SendAnalyzesRequest request) async {
    await DioFactory.dio.post(
      '/additionalData/addAdditionalData',
      data: request.toJson(),
    );
  }
}
