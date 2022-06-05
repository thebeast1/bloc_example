import 'package:bloc_example/data/models/post.dart';
import 'package:bloc_example/data/web_services/demo_web_services.dart';

class DemoRepository {
  late List<Post> _posts;
  late DemoWebServices _demoWebServices;

  DemoRepository(DemoWebServices demoWebServices) {
    _demoWebServices = demoWebServices;
  }

  Future<List<Post>> getAllPosts() async {
    try {
      _posts = await _demoWebServices.getAllPosts();
      return _posts;
    } catch (e) {
      print("--demo repository Error this error is from Demo Repository $e");
      throw e.toString();
    }
  }
}
