import 'package:optiprep/subjects/api/test_interactor.dart';
import 'package:optiprep/subjects/api/test_repository.dart';

class TestDi {
  static final Map<String, dynamic> mp = {};

  static void setValue(TestRepository testRepository, String key) {
    mp[key] = testRepository;
  }

  TestRepository getValue(String key) {
    return mp[key];
  }
}
