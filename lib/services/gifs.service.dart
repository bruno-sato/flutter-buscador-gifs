import 'dart:convert';

import 'package:http/http.dart' as http;

const trendingUrl = "https://api.giphy.com/v1/gifs/trending?api_key=KGXRLFyfQCH0l7TWATMip3KfXe6HPUwx&limit=20&rating=g";

String getSearchUrl(String search, int offset) {
  return "https://api.giphy.com/v1/gifs/search?api_key=KGXRLFyfQCH0l7TWATMip3KfXe6HPUwx&q=$search&limit=19&offset=$offset&rating=g&lang=en";
}

Future<Map> getGifs(String search, int offset) async {
  http.Response response;
  if (search == null || search.isEmpty) {
    response = await http.get(trendingUrl);
  } else {
    response = await http.get(getSearchUrl(search, offset));
  }
  return json.decode(response.body);
}