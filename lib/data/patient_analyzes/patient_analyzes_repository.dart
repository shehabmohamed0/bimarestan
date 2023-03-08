import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../locator/locator.dart';
import '../../models/patient_analyzes/send_analyzes_request.dart';
import 'patient_analyzes_api.dart';

@lazySingleton
class PatientAnalyzesRepository {
  final PatientAnalyzesAPI _api = locator<PatientAnalyzesAPI>();

  Future<void> sendAnalyzes(SendAnalyzesRequest request) async {
    try {
      return _api.sendAnalyzes(request);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
