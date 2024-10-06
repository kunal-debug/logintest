import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndPoints {
  final String _baseUrl = dotenv.env['BASE_URL']!;

  String get isBaseUrl => _baseUrl;


  //Login
  final String loginUrl = 'Assignment/Website/login';

  //list
  final String getListUrl = 'Assignment/Website/getList';


}
