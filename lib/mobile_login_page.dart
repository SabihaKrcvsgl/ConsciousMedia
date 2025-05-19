import 'package:flutter/material.dart';
import 'home_page.dart';
import 'sign_up_page.dart'; // Hesap oluşturma sayfası

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Boş alan kontrolü
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('E-posta ve şifre boş bırakılamaz!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // E-posta format kontrolü
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Geçerli bir e-posta adresi giriniz!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Giriş başarılıysa yönlendirme
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFD8C5),
      appBar: AppBar(
        backgroundColor: Color(0xFF76A47F),
        title: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tekrar Hoş Geldin!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D6B4E),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lütfen giriş yap:',
                style: TextStyle(fontSize: 16, color: Color(0xFF3D6B4E)),
              ),
              SizedBox(height: 30),

              // E-posta input
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'E-posta',
                  labelStyle: TextStyle(color: Color(0xFF3D6B4E)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.email, color: Color(0xFF76A47F)),
                ),
              ),
              SizedBox(height: 20),

              // Şifre input
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Color(0xFF3D6B4E)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF76A47F)),
                ),
              ),
              SizedBox(height: 30),

              // Giriş Yap butonu
              Center(
                child: ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF76A47F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Hesabın yoksa? Hesap oluştur bağlantısı
              Center(
                child: TextButton(
                  onPressed: () => _navigateToSignUp(context),
                  child: Text(
                    'Hesabın yok mu? Hesap Oluştur',
                    style: TextStyle(color: Color(0xFF3D6B4E)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
