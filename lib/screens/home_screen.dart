import 'package:api/api_manger.dart';
import 'package:api/models/products_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  API_Manger api_manger = API_Manger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Integrations"),
      ),
      body: Container(
        child: FutureBuilder<List<Products>>(
          future: api_manger.fetchAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Server error"));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 0.1,
                              child: SizedBox(
                                  height: 150,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      data.image.toString(),
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  data.title.toString(),
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  data.description.toString(),
                                  maxLines: 3,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
