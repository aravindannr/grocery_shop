import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    final parsedJson = json.decode(response.body);
    return parsedJson;
  } else {
    throw Exception('Failed to fetch products');
  }
}
