import 'package:api/models/products_model.dart';
import 'package:http/http.dart' as http;

class API_Manger {
 Future<List<Products>> fetchAllProduct() async {
    const String baseUrl = "https://fakestoreapi.com/products";

    var response = await http.get(Uri.parse(baseUrl));

    return productsFromJson(response.body);
  //   try {
  //     if (response.statusCode == 200) {
  //       print(response.body);
        
  //     } else {
  //       throw "Server error";
  //     }
  //   } catch (e) {
  //     Future.error(e.toString());
  //   }
  }
}
