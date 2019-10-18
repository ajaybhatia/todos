import 'package:flutter/material.dart';
import 'package:todos/models/Item.dart';

class ListItem extends StatelessWidget {
  final Item item;
  final Function completed;
  final Function onRemove;

  const ListItem({Key key, this.item, this.completed, this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          item.name,
          style: TextStyle(
            decoration: item.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        leading: Checkbox(
          value: item.completed,
          onChanged: (bool value) => completed(value),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () => onRemove(),
        ),
      ),
    );
  }
}
