// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'es';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'add': MessageLookupByLibrary.simpleMessage('Agregar contacto'),
    'contacttitle': MessageLookupByLibrary.simpleMessage('Seleccionar contacto'),
    'create': MessageLookupByLibrary.simpleMessage('Crear contacto'),
    'email': MessageLookupByLibrary.simpleMessage('Correo electrónico'),
    'emailtext': MessageLookupByLibrary.simpleMessage('Por favor ingresa un correo electrónico'),
    'name': MessageLookupByLibrary.simpleMessage('Nombre'),
    'nametext': MessageLookupByLibrary.simpleMessage('Por favor ingresa un nombre'),
    'phone': MessageLookupByLibrary.simpleMessage('Teléfono'),
    'phonetext': MessageLookupByLibrary.simpleMessage('Por favor ingresa un número de teléfono'),
    'proceed': MessageLookupByLibrary.simpleMessage('PROCESAR'),
    'search': MessageLookupByLibrary.simpleMessage('Buscar'),
    'subtitle': MessageLookupByLibrary.simpleMessage('Agregar contacto con los detalles apropiados'),
    'title': MessageLookupByLibrary.simpleMessage('Agregar contacto')
  };
}
