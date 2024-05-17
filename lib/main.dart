import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staate/check.dart';
import 'package:staate/list_item.dart';

import 'package:staate/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return Model();
        },
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyWidget(),
        ));
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item(name: 'S 20', price: 250),
      Item(name: 'P 30', price: 350)
    ];
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CheeckOut();
                    }));
                  },
                  icon: const Icon(Icons.add_shopping_cart),
                ),
                const SizedBox(
                  width: 20,
                ),
                Consumer<Model>(
                  builder: (context, model, child) {
                    return Text('${model.count} ');
                  },
                )
              ],
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(child: Consumer<Model>(
              builder: (context, value, child) {
                return ListTile(
                  title: Text('${items[index].name}'),
                  trailing: IconButton(
                    onPressed: () {
                      value.add(items[index]);
                    },
                    icon: const Icon(Icons.add),
                  ),
                );
              },
            ));
          },
        ));
  }
}
