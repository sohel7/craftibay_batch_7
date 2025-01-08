
import 'package:craftybaynew/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lasttNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: buildForm(context),
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const AppLogoWidget(
                height: 70,
                width: 70,
                boxFit: BoxFit.cover,
              ),
              const SizedBox(
                height: 24,
              ),

              Text(
                'Complete Profile Screen',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Get Start With Us ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 8,
              ),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _firstNameTEController,
                decoration: const InputDecoration(hintText: 'First Name'),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Valid First Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _lasttNameTEController,
                decoration: const InputDecoration(hintText: 'Last Name'),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Valied Last Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                controller: _mobileTEController,
                decoration: const InputDecoration(hintText: 'Mobile'),
                maxLength: 11,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Your Mobile Number';
                  }
                  if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false ) {
                    return 'Enter Valied Mobile Number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _cityTEController,
                decoration: const InputDecoration(hintText: 'City'),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Valid City';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _addressTEController,
                maxLines: 3,
                decoration: const InputDecoration(hintText: 'Address'),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Valid Address';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                    if(_formKey.currentState!.validate()){}
                },
                child: const Text('Complete'),
              ),
              // const Text('This code code will Expaired in 120s'),
              const SizedBox(
                height: 12,
              ),
            ],
          );
  }
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lasttNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
   _addressTEController.dispose();
    super.dispose();
  }
}
