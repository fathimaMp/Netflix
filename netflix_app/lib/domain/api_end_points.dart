import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const String downloads = "$KBaseUrl/trending/all/day?api_key=$API_KEY";
}
