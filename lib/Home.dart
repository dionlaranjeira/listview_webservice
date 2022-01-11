import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){
    for(int i=0; i<=10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Lorem ipsum dolor sit met.";
      item["descricao"] = "Descrição ${i} Lorem ipsum dolor sit met.";
      _itens.add(item);
    }
  }


  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista e WebServices"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){

              return ListTile(
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(_itens[indice]["titulo"]),
                          titlePadding: EdgeInsets.all(16),
                          titleTextStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          content: Text(_itens[indice]["descricao"]),
                          contentPadding: EdgeInsets.all(16),
                          actions: [
                            TextButton(
                                onPressed: (){Navigator.pop(context);},
                                child: Text("FECHAR")),
                            TextButton(
                                onPressed: (){Navigator.pop(context);},
                                child: Text("FECHAR")),
                          ],
                        );
                      });
                },
              );
            },
            ),
      ),
    );
  }
}
