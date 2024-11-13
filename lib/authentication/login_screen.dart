import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:brotherhood/providers/authentication_provider.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../utilities/assets_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _phoneNumberController = TextEditingController();
  // final RoundedLoadingButtonController _buttonController = RoundedLoadingButtonController();


  Country selectedCountry = Country(
    phoneCode: '27',
    countryCode: 'RSA',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'South Africa',
    example: 'South Africa',
    displayName: 'South Africa',
    displayNameNoCountryCode: 'RSA',
    e164Key: ''
  );

  @override
  void dispose(){
    _phoneNumberController.dispose();
    // _buttonController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthenticationProvider>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset(AssetsManager.chatAnimation),
              ),
              Text(
                'BrotherHood Files',
                style: GoogleFonts.openSans(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Add your phone number will send you a code to verify',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phoneNumberController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onChanged: (value){
                  setState(() {
                    _phoneNumberController.text = value;
                  });
                },
                decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Phone Number',

                  prefixIcon: Container(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
                    child: InkWell(
                      onTap: (){
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country){
                            setState(() {
                              selectedCountry = country;
                            });
                          }
                        );
                      },
                      child: Text(
                        '+${selectedCountry.flagEmoji} ${selectedCountry.phoneCode}',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: _phoneNumberController.text.length > 9
                      ? authProvider.isLoading
                        ? const CircularProgressIndicator()
                  : InkWell(
                    onTap: (){
                      // Sign In with phone number
                      authProvider.signInWithPhoneNumber(
                          phoneNumber: '+${selectedCountry.phoneCode}${_phoneNumberController.text}',
                          context: context
                      );
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ) : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
