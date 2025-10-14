import 'package:flutter/material.dart';
import '../data/user_data.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 AppBar dengan warna biru dan teks putih
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color.fromARGB(255, 17, 2, 153),
        foregroundColor: Colors.white,
      ),

      // 🔹 Background gambar
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 340,
              child: Card(
                color: const Color.fromARGB(255, 225, 229, 233),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 225, 229, 233),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'FOOTBALL TICKET',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 40, 0, 184),
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),

                      // 🔹 Input Email
                      CustomTextField(
                        controller: emailController,
                        label: "Email",
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(height: 12),

                      // 🔹 Input Password
                      CustomTextField(
                        controller: passwordController,
                        label: "Password",
                        obscureText: true,
                        prefixIcon: Icons.lock,
                      ),
                      const SizedBox(height: 18),

                      // 🔹 Tombol Login
                      ElevatedButton(
                        onPressed: () {
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();

                          try {
                            final user = registeredUsers.firstWhere(
                              (u) => u.email == email && u.password == password,
                            );

                            // ✅ kalau ketemu → masuk Home
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    HomeScreen(username: user.name),
                              ),
                            );
                          } catch (e) {
                            // ❌ kalau tidak ketemu → error
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Email atau password salah"),
                              ),
                            );
                          }
                        },

                        // 🎨 Ganti warna tombol login di sini
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 29, 46, 194), // merah tua
                          foregroundColor: Colors.white, // warna teks
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // 🔹 Tombol ke Register
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Don't have an account? Register",
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 22, 219)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
