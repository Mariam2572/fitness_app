import 'dart:ui';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GlassEffectScreen extends StatelessWidget {
  const GlassEffectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: Stack(
        children: [
          // خلفية الصورة
          Positioned.fill(
            child: Image.asset(
              'assets/images/Property 1=Default.png', // غيّري دي حسب الخلفية بتاعتك
              fit: BoxFit.cover,
            ),
          ),

          // طبقة الـ glass effect
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.neutral80.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                    // border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      const TextField(style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 20),
                      const TextField(style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: Image.asset(AppAssets.mail),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Image.asset(AppAssets.user, height: 30),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
