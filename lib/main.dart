import 'package:flutter/material.dart';
import './Model/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? dataLength;

  List<Data>? data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search App')
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            //Search field
            Container(
              child: TextFormField(
                onChanged: (value) {
              setState(() {
              dataLength = socialData.where((element) => 
              element.title!.toLowerCase().startsWith(value)
              ).length;
               
               data = socialData.where((element) => 
              element.title!.toLowerCase().startsWith(value)
              ).toList();
              
              });
                },
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search)
              ),
              ),
            ),
         ...List.generate( dataLength == null ? socialData.length : dataLength!, (index) {
          final snapshot = data == null ? socialData[index] : data![index];

          return ListTile(
            title: Text(snapshot.title!),
            subtitle: Text(snapshot.followers.toString()),
          );
         })
          ]
            )
        
        ),
      
    );
  }
}

