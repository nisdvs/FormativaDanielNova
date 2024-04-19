import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserData {
  final String name;
  final String service;

  UserData(this.name, this.service);
}

class TelaDois extends StatefulWidget {
  @override
  TelaDoisState createState() => TelaDoisState();
}

class TelaDoisState extends State<TelaDois> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/Salao.jpg',
                height: 130,
              ),
              SizedBox(height: 16.0),
              Text(
                'Faça seu cadastro do seu procedimento realizado no nosso Salão!!!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Nome',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _serviceController,
                decoration: InputDecoration(
                  hintText: 'Serviço',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_nameController.text.isEmpty || _serviceController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Erro'),
                        content: Text('Por favor, preencha todos os campos.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    await postService(_nameController.text, _serviceController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataDisplayPage(data: UserData(_nameController.text, _serviceController.text)),
                      ),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postService(String name, String service) async {
    final response = await http.post(
      Uri.parse('http://10.109.83.18:3000/AvaliaçãoSalão'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nome': name,
        'servico': service,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Falha');
    }
  }
}

class DataDisplayPage extends StatelessWidget {
  final UserData data;

  DataDisplayPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exibindo Informações'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: ${data.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Serviço: ${data.service}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
