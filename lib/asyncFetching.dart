import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/criptoDataModel.dart';


class ApiService {
  Future<List<CriptoDataModel>> fetchData() async {
    final response = await http.get(Uri.parse('https://api.coinlore.net/api/tickers/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      List<dynamic> jsonData = decodedJson['data'];

      List<CriptoDataModel> dataList = [];
      for (var item in jsonData) {
        dataList.add(CriptoDataModel.fromJson(item));
      }

      return dataList;
    } else {
      throw Exception('Ошибка при загрузке данных');
    }
  }
}