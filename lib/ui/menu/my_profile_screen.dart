import 'package:dmboss/widgets/custom_profile_text_field.dart';
import 'package:dmboss/widgets/orange_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(
    text: "Rudra 2",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "9763292525",
  );
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 3,
        title: const Text(
          "My Profile",
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
        // padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06,
          vertical: MediaQuery.of(context).size.height * 0.025,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Notification toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                const Text(
                  "Enable / Disable Notifications",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5),
                Switch(
                  value: false,
                  onChanged: (val) {},
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                  activeColor: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Manage profile
            const Text(
              "Manage profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            CustomProfileTextFormField(
              controller: nameController,
              hintText: "Name",
              icon: Icons.person,
            ),
            const SizedBox(height: 10),
            CustomProfileTextFormField(
              controller: phoneController,
              hintText: "Phone",
              icon: Icons.mobile_friendly,
              readOnly: true,
            ),
            const SizedBox(height: 30),

            OrangeButton(text: "Update Profile", onPressed: () {}),
            const SizedBox(height: 40),

            // Change Password
            const Text(
              "Change Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            CustomProfileTextFormField(
              controller: newPasswordController,
              hintText: "New Password",
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 10),
            CustomProfileTextFormField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 30),

            OrangeButton(text: "Update Password", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
