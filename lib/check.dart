import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staate/list_view.dart';

class CheeckOut extends StatefulWidget {
  const CheeckOut({super.key});

  @override
  State<CheeckOut> createState() => _CheeckOutState();
}

class _CheeckOutState extends State<CheeckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('CheeckOut'),
        ),
        body: Consumer<Model>(
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.basket.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(value.basket[index].name),
                      trailing: IconButton(
                          onPressed: () {
                            value.remove(value.basket[index]);
                          },
                          icon: const Icon(Icons.remove)),
                    ),
                  );
                });
          },
        ));
  }
}
