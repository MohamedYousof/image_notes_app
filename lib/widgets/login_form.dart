import 'package:flutter/material.dart';
import 'package:image_notes/controller/helpers/api_helper.dart';
import 'package:image_notes/screens/home_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _username = '';
  String _password = '';
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Username',
            ),
            onChanged: (String val) {
              _username = val;
            },
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Password',
            ),
            obscureText: true,
            onChanged: (String val) {
              _password = val;
            },
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 55,
            child: _loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).accentColor,
                    ),
                  )
                : TextButton(
                    onPressed: login,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  void login() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _loading = true;
    });
    Api api = Api();

    final token = await api.login(_username, _password);
    if (!token) {
      errDialog('Login error');
      setState(() {
        _loading = false;
      });
    } else {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  void errDialog(String err) async {
    await showDialog<Null>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error Login'),
        content: Text(err),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
