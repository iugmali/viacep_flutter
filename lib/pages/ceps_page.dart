import 'package:flutter/material.dart';
import 'package:viacep_flutter/models/cep_model.dart';
import 'package:viacep_flutter/repositories/cep_repository.dart';

class CEPsPage extends StatefulWidget {
  const CEPsPage({super.key});

  @override
  State<CEPsPage> createState() => _CEPsPageState();
}

class _CEPsPageState extends State<CEPsPage> {
  var cepList = CEPsModel([]);
  final cepRepository = CEPRepository();
  bool loading = false;

  @override
  void initState() {
    _listarCEPs();
    super.initState();
  }

  void _listarCEPs() async {
    setState(() {
      loading = true;
    });
    cepList = await cepRepository.list();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: (loading) ?
              const Center(
                child: CircularProgressIndicator(),
              ) : (cepList.ceps.isEmpty) ?
          const Padding(
            padding:  EdgeInsets.all(16.0),
            child: Center(
              child: Text("Ainda não existem CEPs adicionados. Adicione um CEP consultando na tela de consulta e adicionando através do botão inferior direito.", textAlign: TextAlign.justify,),
            ),
          ) : ListView.separated(
              separatorBuilder: (BuildContext bc, i) => const Divider(),
              itemCount: cepList.ceps.length,
              itemBuilder: (BuildContext bc, i) {
                var cep = cepList.ceps[i];
                return Dismissible(
                    key: Key(cep.objectId!),
                    onDismissed: (direction) async {
                      await cepRepository.remove(cep.objectId!);
                      _listarCEPs();
                    },
                    direction: DismissDirection.endToStart,
                    child: ListTile(
                      leading: Text(cep.cep!),
                      title: Column(
                        children: [
                          Text(cep.logradouro!),
                          Text("${cep.localidade!}/${cep.uf!}"),
                        ],
                      ),
                    )
                );
              }
          ),
        )
    );
  }
}
