
import 'package:get/get.dart';
import 'package:get_x_app/fetch_api/models/game.dart';
import 'package:get_x_app/fetch_api/sources/game_source.dart';

class GameController extends GetxController {
  final _status = ''.obs;
  String get status => _status.value;
  set status(String value) => _status.value = value;

  final _games = <Game>[].obs;
  List<Game> get game => _games;

  fetchGame() async {
    status = 'loading';
    final contents = await GameSource.getLiveGame();
    if(contents == null) {
      status = 'Something went wrong';
      return;
    }
    status = 'success';
    _games.value = contents;
  }
}