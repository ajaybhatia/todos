import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  final TextEditingController _controller = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Item'),
      content: TextFormField(
        autofocus: true,
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Item Name',
          errorText: _validate ? 'Item name can\'t be empty' : null,
          border: OutlineInputBorder(),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Save'),
            onPressed: () {
              this.setState(() {
                _controller.value.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });

              if (_controller.value.text != '') {
                Navigator.of(context).pop(_controller.value.text);
              }
            }),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
