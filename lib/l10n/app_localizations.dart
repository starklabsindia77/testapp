// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get contacttitle {
    return Intl.message(
      'Select Contact',
      name: 'contacttitle',
      locale: locale.toString(),
    );
  }

  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      locale: locale.toString(),
    );
  }

  String get add {
    return Intl.message(
      'Add Contact',
      name: 'add',
      locale: locale.toString(),
    );
  }

  String get create {
    return Intl.message(
      'Create Contact',
      name: 'create',
      locale: locale.toString(),
    );
  }

  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      locale: locale.toString(),
    );
  }

  String get nametext {
    return Intl.message(
      'Please enter a name',
      name: 'nametext',
      locale: locale.toString(),
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      locale: locale.toString(),
    );
  }

  String get emailtext {
    return Intl.message(
      'Please enter an email',
      name: 'emailtext',
      locale: locale.toString(),
    );
  }

  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      locale: locale.toString(),
    );
  }

  String get phonetext {
    return Intl.message(
      'Please enter a phone',
      name: 'phonetext',
      locale: locale.toString(),
    );
  }

  String get title {
    return Intl.message(
      'Add Contact',
      name: 'title',
      locale: locale.toString(),
    );
  }

  String get subtitle {
    return Intl.message(
      'Add Contact with appropriate details',
      name: 'subtitle',
      locale: locale.toString(),
    );
  }

  String get proceed {
    return Intl.message(
      'PROCEED',
      name: 'proceed',
      locale: locale.toString(),
    );
  }

  // Spanish Translations
  String get create_es {
    return Intl.message(
      'Crear Contacto',
      name: 'create',
      locale: 'es',
    );
  }

  String get contacttitle_es {
    return Intl.message(
      'Seleccionar Contacto',
      name: 'contacttitle',
      locale: 'es',
    );
  }

  String get search_es {
    return Intl.message(
      'Buscar',
      name: 'search',
      locale: 'es',
    );
  }

  String get add_es {
    return Intl.message(
      'Agregar Contacto',
      name: 'add',
      locale: 'es',
    );
  }

  String get name_es {
    return Intl.message(
      'Nombre',
      name: 'name',
      locale: 'es',
    );
  }

  String get nametext_es {
    return Intl.message(
      'Por favor ingrese un nombre',
      name: 'nametext',
      locale: 'es',
    );
  }

  String get email_es {
    return Intl.message(
      'Email',
      name: 'email',
      locale: 'es',
    );
  }

  String get emailtext_es {
    return Intl.message(
      'Por favor ingrese un email',
      name: 'emailtext',
      locale: 'es',
    );
  }

  String get phone_es {
    return Intl.message(
      'Teléfono',
      name: 'phone',
      locale: 'es',
    );
  }

  String get phonetext_es {
    return Intl.message(
      'Por favor ingrese un teléfono',
      name: 'phonetext',
      locale: 'es',
    );
  }

  String get title_es {
    return Intl.message(
      'Agregar Contacto',
      name: 'title',
      locale: 'es',
    );
  }

  String get subtitle_es {
    return Intl.message(
      'Agregar Contacto con los detalles apropiados',
      name: 'subtitle',
      locale: 'es',
    );
  }

  String get proceed_es {
    return Intl.message(
      'CONTINUAR',
      name: 'proceed',
      locale: 'es',
    );
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
