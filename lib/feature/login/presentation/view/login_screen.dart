import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Super Fitness Login',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/auth back ground.png"),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.6)),

          // Foreground content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset('assets/images/logo.png', height: 80),
                    const SizedBox(height: 40),

                    // Welcome Text
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey There",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "WELCOME BACK",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Login Title
                    SharedContainer(
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Email
                        _buildInputField(Icons.email_outlined, "Email"),
                        const SizedBox(height: 8),

                        // Password
                        _buildInputField(
                          Icons.lock_outline,
                          "Password",
                          isPassword: true,
                        ),
                        const SizedBox(height: 8),

                        // Forget Password
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(
                              color: AppColors.mainRed,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // OR divider
                        const Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Or",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.white)),
                          ],
                        ),

                        const SizedBox(height: 24),
                        // Social icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon(Icons.facebook),
                            const SizedBox(width: 20),
                            _buildSocialIcon(Icons.g_mobiledata_sharp),
                            const SizedBox(width: 20),
                            _buildSocialIcon(Icons.apple),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainRed,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Register Link
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t Have An Account Yet ? ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Register",
                              style: TextStyle(
                                color: AppColors.mainRed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
    IconData icon,
    String hint, {
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white60),
          prefixIcon: Icon(icon, color: Colors.white),
          suffixIcon:
              isPassword
                  ? const Icon(Icons.visibility, color: Colors.white)
                  : null,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.black87,
      child: Icon(icon, color: Colors.white),
    );
  }
}
