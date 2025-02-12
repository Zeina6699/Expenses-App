import 'package:flutter/material.dart';

class customAlertDialog extends StatefulWidget {
  const customAlertDialog({
    super.key,
  });

  @override
  State<customAlertDialog> createState() => _customAlertDialogState();
}

class _customAlertDialogState extends State<customAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('sss'),
      content: const Text('ssss'),
       actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();},
         child:const Text('Ok'))
       ],
    );
  }
}
