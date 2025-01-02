import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VoterFormController extends GetxController {
  var name = ''.obs;
  var gender = ''.obs;
  var address = ''.obs;
  var post = ''.obs;
  var village = ''.obs;
  var taluka = ''.obs;
  var district = ''.obs;
  var pincode = ''.obs;
  var mobile = ''.obs;
  var birthDate = ''.obs;
  var photoIdProof = ''.obs;
  var addressProof = ''.obs;
  var otherDocument = ''.obs;
  var signature = ''.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageForPhotoIdProof() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photoIdProof.value = pickedFile.path;
    }
  }

  Future<void> pickImageForAddressProof() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      addressProof.value = pickedFile.path;
    }
  }

  Future<void> pickImageForOtherDocument() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      otherDocument.value = pickedFile.path;
    }
  }

  bool validateForm() {
    // Check if required fields are empty
    if (name.value.isEmpty ||
        gender.value.isEmpty ||
        address.value.isEmpty ||
        taluka.value.isEmpty ||
        district.value.isEmpty ||
        pincode.value.isEmpty ||
        mobile.value.isEmpty ||
        photoIdProof.value.isEmpty ||
        addressProof.value.isEmpty ||
        otherDocument.value.isEmpty) {
      return false;
    }
    return true;
  }
}

class VoterRegistrationPage extends StatelessWidget {
  final VoterFormController controller = Get.put(VoterFormController());

  // Gender List
  final List<String> genderList = ['Male', 'Female', 'Other'];

  // Districts of Maharashtra
  final List<String> maharashtraDistricts = [
    'Ahmednagar',
    'Akola',
    'Amravati',
    'Aurangabad',
    'Beed',
    'Bhandara',
    'Buldhana',
    'Chandrapur',
    'Dhule',
    'Gadchiroli',
    'Gondia',
    'Hingoli',
    'Jalgaon',
    'Jalna',
    'Kolhapur',
    'Latur',
    'Mumbai City',
    'Mumbai Suburban',
    'Nagpur',
    'Nanded',
    'Nandurbar',
    'Nashik',
    'Osmanabad',
    'Palghar',
    'Parbhani',
    'Pune',
    'Raigad',
    'Ratnagiri',
    'Sangli',
    'Satara',
    'Sindhudurg',
    'Solapur',
    'Thane',
    'Wardha',
    'Washim',
    'Yavatmal'
  ];

  // Talukas of Pune as an example
  final List<String> puneTalukas = [
    'Pune City',
    'Haveli',
    'Mulshi',
    'Baramati',
    'Indapur',
    'Junnar',
    'Khed (Rajgurunagar)',
    'Maval',
    'Shirur',
    'Daund',
    'Ambegaon',
    'Bhor',
    'Velhe',
    'Purandar'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Voter Registration',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fill in your details below:',
                style: GoogleFonts.roboto(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 20),
              buildInputCard(
                title: 'Personal Information',
                children: [
                  buildTextField('Name', controller.name),
                  buildDropdown('Gender', controller.gender, genderList),
                  buildTextField(
                      'Birth Date (YYYY-MM-DD)', controller.birthDate),
                ],
              ),
              SizedBox(height: 20),
              buildInputCard(
                title: 'Address Details',
                children: [
                  buildTextField('Address', controller.address),
                  buildTextField('Post', controller.post),
                  buildTextField('Village', controller.village),
                  buildDropdown('Taluka', controller.taluka, puneTalukas),
                  buildDropdown(
                      'District', controller.district, maharashtraDistricts),
                  buildTextField('Pincode', controller.pincode, isNumber: true),
                  buildTextField('Mobile', controller.mobile, isPhone: true),
                ],
              ),
              SizedBox(height: 20),
              buildInputCard(
                title: 'Upload Documents',
                children: [
                  buildUploadRow(
                    'Photo ID Proof',
                    controller.photoIdProof,
                    controller.pickImageForPhotoIdProof,
                  ),
                  buildUploadRow(
                    'Address Proof',
                    controller.addressProof,
                    controller.pickImageForAddressProof,
                  ),
                  buildUploadRow(
                    'Other Document',
                    controller.otherDocument,
                    controller.pickImageForOtherDocument,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (controller.validateForm()) {
                      // Handle form submission
                      Get.snackbar(
                          'Form Submitted', 'Form submission successful!');
                    } else {
                      Get.snackbar(
                          'Error', 'Please fill in all required fields',
                          backgroundColor: Colors.red, colorText: Colors.white);
                    }
                  },
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Submit Form',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputCard(
      {required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, RxString fieldValue,
      {bool isNumber = false, bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: isNumber
            ? TextInputType.number
            : isPhone
                ? TextInputType.phone
                : TextInputType.text,
        onChanged: (value) => fieldValue.value = value,
      ),
    );
  }

  Widget buildDropdown(
      String label, RxString selectedValue, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(() {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          value: selectedValue.value.isEmpty ? null : selectedValue.value,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) => selectedValue.value = value ?? '',
        );
      }),
    );
  }

  Widget buildUploadRow(
      String label, RxString filePath, VoidCallback onUpload) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Obx(() => filePath.value.isEmpty
                ? Text('$label: No file selected')
                : Image.file(
                    File(filePath.value),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  )),
          ),
          ElevatedButton.icon(
            onPressed: onUpload,
            icon: Icon(Icons.upload_file),
            label: Text('Upload'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: VoterRegistrationPage(),
  ));
}
