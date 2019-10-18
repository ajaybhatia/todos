import 'package:flutter/material.dart';
import 'package:todos/models/Item.dart';
import 'package:todos/ui/widgets/ListItem.dart';
import 'package:todos/ui/widgets/Modal.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
  }

  void _onPressed() async {
    String name = await showDialog<String>(
      context: context,
      builder: (_) => Modal(),
    );

    if (name != null) {
      setState(() {
        _items.add(
          Item(
            name: name,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onPressed,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListItem(
          item: _items[index],
          completed: (bool value) =>
              this.setState(() => _items[index].completed = value),
          onRemove: () => this.setState(
            () => _items.removeAt(index),
          ),
        );
      },
    );
  }
}
