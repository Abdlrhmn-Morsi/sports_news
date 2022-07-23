import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_news/model/soccer_model.dart';

class GetDataController extends GetxController {
  Future<List<Soccer>> fetchData(lang,cntr) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?language=$lang&country=$cntr&category=sports&apiKey=984005c37e8847f49f9ceaa50f3479b8');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<Soccer> news = [];
      var jsonString = jsonDecode(response.body);
      for (var e in (jsonString['articles'] as List)) {
        news.add(Soccer.fromJson(e));
      }
      print('${news.length}= ===========');
      return news;
    } else {
      return throw {'error occured'};
    }
  }
  var currentIndexTagsTop = 0.obs;
  var currentIndexTagsBottom = 0.obs;


  @override
  void onInit() {
    fetchData('','');
    super.onInit();
  }
}
