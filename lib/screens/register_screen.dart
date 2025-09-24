import 'package:flutter/material.dart';
import '../models/user.dart';
import '../data/user_data.dart';
import 'login_screen.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Icon(Icons.sports_soccer,
                size: 60, color: Color.fromARGB(255, 0, 0, 0)),
            const SizedBox(height: 15),
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: nameController,
              label: "Name",
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: emailController,
              label: "Email",
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              label: "Password",
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text.trim();
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Semua field harus diisi")),
                  );
                  return;
                }

                if (password.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Password minimal 6 karakter")),
                  );
                  return;
                }

                // ✅ simpan user baru
                registeredUsers.add(
                  User.create(name: name, email: email, password: password),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Registrasi berhasil!")),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: const Text("Register"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: const Text(
                "Already have an account? Login",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
