
import 'dart:convert';

import 'package:get_x_app/fetch_api/models/game.dart';
import 'package:http/http.dart' as http;

class GameSource {
  static Future<List<Game>?> getLiveGame() async {
    String apiUrl = "https://www.freetogame.com/api/games";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List contents = json.decode(response.body);
        return contents.map((e) => Game.fromJson(Map.from(e))).toList();
      } else {
        return null;
      }
    } catch(e) {
      return null;
    }
  }
}