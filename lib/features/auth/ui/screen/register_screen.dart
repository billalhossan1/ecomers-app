import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/auth/ui/screen/pin_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String name = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
TextEditingController _firstNameTEController=TextEditingController();
TextEditingController _lastNameTEController=TextEditingController();
TextEditingController _mobileTEController=TextEditingController();
TextEditingController _cityTEController=TextEditingController();
TextEditingController _addressTEController=TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(55.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              SvgPicture.asset(
                AssetsPath.logo,
                width: 80,
                height: 120,
              ),
              const SizedBox(height: 18),
              AppThemeData.primaryText('Complete Profile'),
              const SizedBox(height: 10),
              AppThemeData.secondaryText('Get started with us with your details'),
              const SizedBox(height: 26),
              AppThemeData.textFormField('First Name', 1,_firstNameTEController,(value){
                if(value == null  || value.isEmpty)
                  {
                    return 'Please Enter Your First Name';
                  }
                else {
                  return null;
                }
              },TextInputType.text),
              const SizedBox(height: 12),
              AppThemeData.textFormField('Last Name', 1,_lastNameTEController,(value){
                if(value == null  || value.isEmpty)
                {
                  return 'Please Enter Your Last Name';
                }
                else {
                  return null;
                }
              },TextInputType.text),
              const SizedBox(height: 12),
              AppThemeData.textFormField('Mobile', 1,_mobileTEController,(value){
                if(value == null  || value.isEmpty)
                {
                  return 'Please Enter Your Mobile Number';
                }
                else {
                  return null;
                }
              },TextInputType.number),
              const SizedBox(height: 12),
              AppThemeData.textFormField('City', 1,_cityTEController,(value){
                if(value == null  || value.isEmpty)
                {
                  return 'Please Enter Your City Name';
                }
                else {
                  return null;
                }
              },TextInputType.text),
              const SizedBox(height: 12),
              AppThemeData.textFormField('Shipping Address', 3,_addressTEController,(value){
                if(value == null  || value.isEmpty)
                {
                  return 'Please Enter Your Shipping Address';
                }
                else {
                  return null;
                }
              },TextInputType.streetAddress),
              const SizedBox(height: 23),
              AppThemeData.nextButton(onPressed: _moveToNextScreen)
            ],
          ),
        ),
      ),
    );
  }
  void _moveToNextScreen(){
    //TODO
    Navigator.pushNamed(context, PinVerificationScreen.name);
  }
}
