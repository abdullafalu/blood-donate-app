import 'package:blood_donation/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../widgets/custome_textfeild.dart';

// ignore: must_be_immutable
class AddUser extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final bloodGroups = ['A+', 'A-', 'AB+', 'AB-', 'O+', 'B+', 'B-', 'O+', 'O-'];
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donator');
  String? selectedGroup;
  AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Add Donor"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomTextfeild(
                controller: nameController,
                textName: "Please enter your Name",
              ),
              kHeight15,
              CustomTextfeild(
                textName: "Please enter your mobile number",
                controller: numberController,
              ),
              kHeight15,
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: "Select blood group",
                  ),
                  items: bloodGroups
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    selectedGroup = val;
                  }),
              kHeight15,
              GestureDetector(
                onTap: () {
                  if (nameController.text.isNotEmpty &&
                      numberController.text.isNotEmpty &&
                      selectedGroup!.isNotEmpty) {
                        addDonor();
                  Get.to(const HomeScreen());
                      }
                      else{
                        Get.snackbar("error", "Textfeild cannot be empty");
                      }
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kRedColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  addDonor() {
    final data = {
      'name': nameController.text,
      'number': numberController.text,
      'group': selectedGroup,
    };
    donor.add(data);
  }
}
