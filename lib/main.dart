import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logintest/main_common.dart';

void main() async {
  // Load env file
  await dotenv.load(fileName: '.env');
  mainCommon();
}
