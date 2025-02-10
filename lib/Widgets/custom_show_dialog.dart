import 'package:flutter/material.dart';

class customAlertDialog extends StatelessWidget {
  const customAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('sss'),
      content: Text('ssss'),
       actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();},
         child:Text('Ok'))
       ],
    );
  }
}
