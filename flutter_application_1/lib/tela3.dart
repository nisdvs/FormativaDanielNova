import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaTres extends StatefulWidget {
  @override
  TelaTresState createState() => TelaTresState();
}

class TelaTresState extends State<TelaTres> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://10.109.83.18:3000/AvaliaçãoSalão'));
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      throw Exception('Falha');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exibindo Informações'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return ListTile(
            title: Text('ID: ${item['id']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nome: ${item['nome']}'),
                Text('Serviço: ${item['servico']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}