import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        
        /// ENGLISH
        
        'en': {
          'app_name': 'Weather Conditions',
          'city_input_hint': 'Enter the name of a city',
          'settings': 'Settings',
          'celsius': 'Celsius',
          'fahrenheit': 'Fahrenheit',
          'light_mode': 'Light Mode',
          'dark_mode': 'Dark Mode',
          'error': 'Error',
          'error_city': 'You entered an invalid city. Please try again.',
          'celsius_degrees': '°C',
          'fahrenheit_degrees': '°F',
          'min_t': 'Min T.',
          'max_t': 'Max T.',
        },

        /// ITALIAN

        'it': {
          'app_name': 'Weather Conditions',
          'city_input_hint': 'Inserisci il nome di una città',
          'settings': 'Impostazioni',
          'error': 'Errore',
          'error_city': 'Hai inserito una città non valida. Per favore riprova.'
        }
      };
}