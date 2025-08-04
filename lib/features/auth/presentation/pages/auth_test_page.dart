import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_providers.dart';

class AuthTestPage extends ConsumerStatefulWidget {
  const AuthTestPage({super.key});

  @override
  ConsumerState<AuthTestPage> createState() => _AuthTestPageState();
}

class _AuthTestPageState extends ConsumerState<AuthTestPage> {
  final _emailController = TextEditingController(text: 'test@example.com');
  final _passwordController = TextEditingController(text: 'password');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: authState.isLoading
                  ? null
                  : () {
                      ref.read(authProvider.notifier).login(
                            _emailController.text,
                            _passwordController.text,
                          );
                    },
              child: authState.isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('LOGIN'),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                authState.isAuthenticated ? 'LOGIN OK' : 'LOGIN KO',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: authState.isAuthenticated ? Colors.green : Colors.red,
                ),
              ),
            ),
            if (authState.error != null) ...[
              SizedBox(height: 10),
              Text(
                'Error: ${authState.error}',
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}