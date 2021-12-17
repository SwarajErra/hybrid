import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResumeForm extends StatefulWidget {
  const ResumeForm({Key? key}) : super(key: key);

  @override
  ResumeFormState createState() => ResumeFormState();
}

class ResumeFormState extends State<ResumeForm> {
  String firstName = "";
  String lastName = "";
  String address = "";
  String mobile = "";
  String email = "";
  String education = "";
  String experience = "";
  bool _value = false;
  int val = -1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "First Name"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your first name";
        }
      },onSaved: (String? value){
      firstName = value!;
    },
    );
  }
  Widget _buildLastNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Last Name"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your Last name";
        }
      },onSaved: (String? value){
      lastName = value!;
    },
    );
  }
  Widget _buildAddressField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "address"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your address";
        }
      },onSaved: (String? value){
      address = value!;
    },
    );
  }
  Widget _buildMobileField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "mobile"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your mobile number";
        }
      },onSaved: (String? value){
      mobile = value!;
    },
    );
  }
  Widget _buildEmailField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "email"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your email";
        }
      },onSaved: (String? value){
      email = value!;
    },
    );
  }
  Widget _buildEducationField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "education"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your qualification";
        }
      },onSaved: (String? value){
      education = value!;
    },
    );
  }
  Widget _buildExperienceField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "experience"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your experience";
        }
      },onSaved: (String? value){
      experience = value!;
    },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aspiring employee deails"),backgroundColor: Colors.green,),
      body: Container(
        //margin: EdgeInsets.all(1),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildFirstNameField(),
              _buildLastNameField(),
              _buildAddressField(),
              _buildMobileField(),
              _buildEmailField(),
              _buildEducationField(),
              _buildExperienceField(),
              SizedBox(height: 120,),
              ElevatedButton(onPressed: ()  {
                if(!_formKey.currentState!.validate()){
                  return;
                }
                _formKey.currentState!.save();
              },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),

                ),
                child:Text('Submit'),)
            ],
          ),
        ),
      ),
    );
  }
}