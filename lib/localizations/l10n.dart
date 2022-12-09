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

  /// `success`
  String get success_response_message {
    return Intl.message(
      'success',
      name: 'success_response_message',
      desc: '',
      args: [],
    );
  }

  /// `no_content`
  String get no_content_response_message {
    return Intl.message(
      'no_content',
      name: 'no_content_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.BAD_REQUEST`
  String get bad_request_response_message {
    return Intl.message(
      'ResponseMessage.BAD_REQUEST',
      name: 'bad_request_response_message',
      desc: '',
      args: [],
    );
  }

  /// ` ResponseMessage.FORBIDDEN`
  String get forbidden_response_message {
    return Intl.message(
      ' ResponseMessage.FORBIDDEN',
      name: 'forbidden_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.UNAUTORISED`
  String get unauthorized_response_message {
    return Intl.message(
      'ResponseMessage.UNAUTORISED',
      name: 'unauthorized_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.NOT_FOUND`
  String get not_found_response_message {
    return Intl.message(
      'ResponseMessage.NOT_FOUND',
      name: 'not_found_response_message',
      desc: '',
      args: [],
    );
  }

  /// ` ResponseMessage.INTERNAL_SERVER_ERROR`
  String get internal_server_error_response_message {
    return Intl.message(
      ' ResponseMessage.INTERNAL_SERVER_ERROR',
      name: 'internal_server_error_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.CONNECT_TIMEOUT`
  String get connect_timeout_response_message {
    return Intl.message(
      'ResponseMessage.CONNECT_TIMEOUT',
      name: 'connect_timeout_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.CANCEL`
  String get cancel_response_message {
    return Intl.message(
      'ResponseMessage.CANCEL',
      name: 'cancel_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.RECIEVE_TIMEOUT`
  String get recieve_timeout_response_message {
    return Intl.message(
      'ResponseMessage.RECIEVE_TIMEOUT',
      name: 'recieve_timeout_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.SEND_TIMEOUT`
  String get send_timeout_response_message {
    return Intl.message(
      'ResponseMessage.SEND_TIMEOUT',
      name: 'send_timeout_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.CACHE_ERROR`
  String get cache_error_response_message {
    return Intl.message(
      'ResponseMessage.CACHE_ERROR',
      name: 'cache_error_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.NO_INTERNET_CONNECTION`
  String get not_internet_connection_response_message {
    return Intl.message(
      'ResponseMessage.NO_INTERNET_CONNECTION',
      name: 'not_internet_connection_response_message',
      desc: '',
      args: [],
    );
  }

  /// `ResponseMessage.DEFAULT`
  String get default_response_message {
    return Intl.message(
      'ResponseMessage.DEFAULT',
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
