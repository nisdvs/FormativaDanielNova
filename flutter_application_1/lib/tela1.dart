import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela2.dart';

class TelaUm extends StatelessWidget {
  TelaUm({super.key});
  TextEditingController _user = TextEditingController();
  TextEditingController _passw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salão Alanis Fashion"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Faça seu login :)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: "Digite seu nome"),
            controller: _user,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Digite sua senha"),
            obscureText: true,
            obscuringCharacter: '*',
            controller: _passw,
          ),
          ElevatedButton(
            onPressed: () {
              if (_user.text == "alanis" && _passw.text == "1234") {
                print('Login correto');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaDois()),
                );
              } else {
                print("Login incorreto");
              }
            },
            child: Text("Entrar"),
          ),
        ],
      ),
    );
  }
}
