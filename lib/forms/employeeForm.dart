import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResumeForm extends StatefulWidget {
  static List<profileAd> profileadds = [
    profileAd(first_name:'krinesh',
        last_name:'patel',
        address:'5550 ave trent,montreal',
        mobile:'+1234567890',
        email: 'krinesh@gmail.com',
        education: 'B.tech',
        experience: '1 year')
  ];


  const ResumeForm({Key? key}) : super(key: key);

  @override
  ResumeFormState createState() => ResumeFormState();

}

class profileAd {
  final String first_name;
  final String last_name ;
  final String address ;
  final String mobile ;
  final String email ;
  final String education;
  final String experience;

  profileAd(
  { required this.first_name,
    required this.last_name,
    required this.address,
    required this.mobile,
    required this.email,
    required this.education,
    required this.experience});
}

class ResumeFormState extends State<ResumeForm> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference profiledata =
  FirebaseFirestore.instance.collection("profiledata");

  late final Function addTx;
  String first_name = "";
  String last_name = "";
  String address = "";
  String mobile = "";
  String email = "";
  String education = "";
  String experience = "";

  final first_nameController = TextEditingController();
  final last_nameController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();

  Widget _buildFirstNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "First Name"),
      validator: (String? value){
        if(value!.isEmpty){
          return "Please enter your first name";
        }
      },onSaved: (String? value){
      first_nameController.text = value!;
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
      last_nameController.text = value!;
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
      addressController.text = value!;
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
      mobileController.text = value!;
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
      emailController.text = value!;
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
      educationController.text = value!;
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
      experienceController.text = value!;
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
              SizedBox(height: 150,),
              ElevatedButton(onPressed: ()  {
                pushData(first_nameController.text,last_nameController.text,addressController.text,mobileController.hashCode,
                emailController.text,educationController.text,experienceController.text);
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
  void pushData(String first_name,String last_name,String address,int mobile,String email,String education,String experience) async {
    if (_formKey.currentState!.validate()) {
      await profiledata.add({"first_name": first_name,
        'last_name': last_name,
        'address': address,
        'mobile': mobile,

        'email': email,
        'education': education,
        'experience': experience
      })
          .then((value) => {});
      {
        Fluttertoast.showToast(msg: "Profile Updated Successful");
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //  profiledata userModel = profiledata();

  //  userModel.jobType = first_nameController.text;

    await firebaseFirestore.collection("profiledata").add({
      'first_name': first_name,
      'last_name': last_name,
      'address': address,
      'mobile': mobile,
      'email': email,
      'education': education,
      'experience': experience
    });

  }
  }