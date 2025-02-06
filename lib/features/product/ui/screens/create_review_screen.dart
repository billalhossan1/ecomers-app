import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});
  static String name = '/create-review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _writeReviewTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppThemeData.primaryText('Create Review'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppThemeData.textFormField(
                      'First Name', 1, _firstNameTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your First Name';
                    } else {
                      return null;
                    }
                  }, TextInputType.text),
                  const SizedBox(height: 18),
                  AppThemeData.textFormField(
                      'Last Name', 1, _lastNameTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Last Name';
                    } else {
                      return null;
                    }
                  }, TextInputType.text),
                  const SizedBox(height: 18),
                  AppThemeData.textFormField(
                      'Review Message', 10, _writeReviewTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Review Message';
                    } else {
                      return null;
                    }
                  },TextInputType.text),
                  const SizedBox(height: 18),
                  AppThemeData.nextButton(onPressed: (){},name: 'Submit')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
