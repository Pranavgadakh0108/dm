import 'package:dmboss/widgets/custom_profile_text_field.dart';
import 'package:dmboss/widgets/orange_button.dart';
import 'package:flutter/material.dart';

class AddBankDetails extends StatefulWidget {
  const AddBankDetails({super.key});

  @override
  State<AddBankDetails> createState() => _AddBankDetailsState();
}

class _AddBankDetailsState extends State<AddBankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Add Bank Details",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                'Add Back A/C Details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 20),
              CustomProfileTextFormField(
                controller: TextEditingController(),
                hintText: "A/C Holder Name",
              ),
              SizedBox(height: 20),
              CustomProfileTextFormField(
                controller: TextEditingController(),
                hintText: "A/C Number",
              ),
              SizedBox(height: 20),
              CustomProfileTextFormField(
                controller: TextEditingController(),
                hintText: "IFSC",
              ),
              SizedBox(height: 20),
              OrangeButton(text: "Submit", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
