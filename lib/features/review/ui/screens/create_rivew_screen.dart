import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateRivewScreen extends StatefulWidget {
  const CreateRivewScreen({super.key});

  @override
  State<CreateRivewScreen> createState() => _CreateRivewScreenState();
}

class _CreateRivewScreenState extends State<CreateRivewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
        leading: IconButton(
          onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'First Name'
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Last Name'
            ),
          ),
        ],
      ),
    );
  }


}
