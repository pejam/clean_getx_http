import 'dart:convert' as convert;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PlatformFile avatarFile;
  late http.Client client = http.Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _getImageByFilePicker();
                },
                child: const Text('pick image')),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  postProduct();
                },
                child: const Text('send image')),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  getRequest('https://fakestoreapi.com/products','limit=5');
                },
                child: const Text('get with param')),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  getRequest('https://fakestoreapi.com/products');
                },
                child: const Text('get without param')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getProductList();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void getProductList() async {
    var url = Uri.https('fakestoreapi.com', '/products');
// Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<Product> productList = List<Product>.from(convert
          .jsonDecode(response.body));
          //.map((dynamic) => Product.fromJson(dynamic)));
    } else {}
  }

  postProduct() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    var request = http.MultipartRequest('POST', url);
    request.fields['title'] = 'man united';
    request.files.add(http.MultipartFile.fromBytes('image', avatarFile.bytes!,
        filename: avatarFile.name));
    var response = await request.send();
    if (response.statusCode == 200) {
    } else {}
  }

  _getImageByFilePicker() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (pickedFile != null) {
      avatarFile = pickedFile.files.single;
    } else {
      // User canceled the picker
    }
  }

  Future<dynamic> getRequest(String route, [String params = '']) async {
    await client
        .get(Uri.parse(params.isEmpty ? route : '$route?$params'))
        .then((value) => print(value.body));
  }
}
