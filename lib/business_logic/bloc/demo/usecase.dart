import 'package:bloc_example/business_logic/bloc/demo/demo_bloc.dart';
import 'package:bloc_example/data/models/post.dart';
import 'package:bloc_example/data/repository/demo_repository.dart';
import 'package:bloc_example/data/web_services/demo_web_services.dart';

class DemoUseCases {
  final DemoRepository demoRepository = DemoRepository(DemoWebServices());
  List<Post> _posts = [];

  Future<DemoState> loadPostsList() async {
    print("---This is what happend now: the data is loading...");
    try {
      _posts = await demoRepository.getAllPosts();
      return LoadedDemoState(posts: _posts);
    } catch (e) {
      print("--- demo bloc Error This Error message is from Demo Bloc $e");
      return ErrorDemoState(
        error: e.toString(),
      );
    }
  }

}
