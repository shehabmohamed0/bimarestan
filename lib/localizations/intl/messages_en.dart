// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bad_request_response_message":
            MessageLookupByLibrary.simpleMessage("ResponseMessage.BAD_REQUEST"),
        "cache_error_response_message":
            MessageLookupByLibrary.simpleMessage("ResponseMessage.CACHE_ERROR"),
        "cancel_response_message":
            MessageLookupByLibrary.simpleMessage("ResponseMessage.CANCEL"),
        "connect_timeout_response_message":
            MessageLookupByLibrary.simpleMessage(
                "ResponseMessage.CONNECT_TIMEOUT"),
        "default_response_message":
            MessageLookupByLibrary.simpleMessage("ResponseMessage.DEFAULT"),
        "forbidden_response_message":
            MessageLookupByLibrary.simpleMessage(" ResponseMessage.FORBIDDEN"),
        "internal_server_error_response_message":
            MessageLookupByLibrary.simpleMessage(
                " ResponseMessage.INTERNAL_SERVER_ERROR"),
        "no_content_response_message":
            MessageLookupByLibrary.simpleMessage("no_content"),
        "not_found_response_message":
            MessageLookupByLibrary.simpleMessage("ResponseMessage.NOT_FOUND"),
        "not_internet_connection_response_message":
            MessageLookupByLibrary.simpleMessage(
                "ResponseMessage.NO_INTERNET_CONNECTION"),
        "recieve_timeout_response_message":
            MessageLookupByLibrary.simpleMessage(
                "ResponseMessage.RECIEVE_TIMEOUT"),
        "send_timeout_response_message": MessageLookupByLibrary.simpleMessage(
            "ResponseMessage.SEND_TIMEOUT"),
        "success_response_message":
            MessageLookupByLibrary.simpleMessage("success"),
        "unauthorized_response_message":
            MessageLookupByLibrary.simpleMessage("ResponseMessage.UNAUTORISED")
      };
}
