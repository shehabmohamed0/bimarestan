// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Success`
  String get success_response_message {
    return Intl.message(
      'Success',
      name: 'success_response_message',
      desc: '',
      args: [],
    );
  }

  /// `No Content`
  String get no_content_response_message {
    return Intl.message(
      'No Content',
      name: 'no_content_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request`
  String get bad_request_response_message {
    return Intl.message(
      'Bad Request',
      name: 'bad_request_response_message',
      desc: '',
      args: [],
    );
  }

  /// ` Forbidden`
  String get forbidden_response_message {
    return Intl.message(
      ' Forbidden',
      name: 'forbidden_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized_response_message {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get not_found_response_message {
    return Intl.message(
      'Not Found',
      name: 'not_found_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server Error`
  String get internal_server_error_response_message {
    return Intl.message(
      'Internal Server Error',
      name: 'internal_server_error_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Connection Timeout`
  String get connect_timeout_response_message {
    return Intl.message(
      'Connection Timeout',
      name: 'connect_timeout_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get cancel_response_message {
    return Intl.message(
      'Canceled',
      name: 'cancel_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Recieve Timeout`
  String get recieve_timeout_response_message {
    return Intl.message(
      'Recieve Timeout',
      name: 'recieve_timeout_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Send Timeout`
  String get send_timeout_response_message {
    return Intl.message(
      'Send Timeout',
      name: 'send_timeout_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Cache Error`
  String get cache_error_response_message {
    return Intl.message(
      'Cache Error',
      name: 'cache_error_response_message',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get not_internet_connection_response_message {
    return Intl.message(
      'No Internet Connection',
      name: 'not_internet_connection_response_message',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get default_response_message {
    return Intl.message(
      'Something went wrong',
      name: 'default_response_message',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
