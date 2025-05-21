import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;

  String _email = '';
  String _password = '';
  String _role = 'customer';
  String _referralCode = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    _formKey.currentState?.save();

    // TODO: Implement authentication logic with backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Register'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                key: ValueKey('email'),
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                key: ValueKey('password'),
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters long.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value ?? '';
                },
              ),
              if (!_isLogin) ...[
                SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _role,
                  items: [
                    DropdownMenuItem(child: Text('Customer'), value: 'customer'),
                    DropdownMenuItem(child: Text('Agent'), value: 'agent'),
                    DropdownMenuItem(child: Text('Business'), value: 'business'),
                    DropdownMenuItem(child: Text('Tasker'), value: 'tasker'),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _role = value ?? 'customer';
                    });
                  },
                  decoration: InputDecoration(labelText: 'Role'),
                ),
                SizedBox(height: 12),
                TextFormField(
                  key: ValueKey('referral'),
                  decoration: InputDecoration(labelText: 'Referral Code (optional)'),
                  onSaved: (value) {
                    _referralCode = value ?? '';
                  },
                ),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _trySubmit,
                child: Text(_isLogin ? 'Login' : 'Register'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(_isLogin
                    ? 'Create new account'
                    : 'I already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
