import 'package:json_annotation/json_annotation.dart';

part 'send_analyzes_request.g.dart';

@JsonSerializable()
class SendAnalyzesRequest {
  final int userId;
  @JsonKey(name: 'data')
  final List<String> images;
  final String description;
  const SendAnalyzesRequest({
    required this.userId,
    required this.images,
    required this.description,
  });

  factory SendAnalyzesRequest.fromJson(Map<String, dynamic> json) =>
      _$SendAnalyzesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendAnalyzesRequestToJson(this);
}
