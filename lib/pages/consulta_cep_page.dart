import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viacep_flutter/models/cep_model.dart';
import 'package:viacep_flutter/repositories/cep_repository.dart';
import 'package:viacep_flutter/utils/regex_input_formatter.dart';
import 'package:viacep_flutter/main.dart';


class ConsultaCEPPage extends StatefulWidget {
  const ConsultaCEPPage({super.key});
  @override
  State<ConsultaCEPPage> createState() => _ConsultaCEPPageState();
}

class _ConsultaCEPPageState extends State<ConsultaCEPPage> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(navigatorKey.currentContext!);
  }

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("CEP adicionado à lista."),
      ],
    ),
  );

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
    );
  }

  bool loading = false;
  var cepModel = CEPModel();
  var cepRepository = CEPRepository();

  void _addCEP() async {
    if (cepModel.cep != null) {
      var cepList = await cepRepository.list();
      if (!cepList.ceps.any((item) => item.cep == cepModel.cep)) {
        await cepRepository.add(cepModel);
        _showToast();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              children: [
                const Text(
                  "Consulta de CEP",
                  style: TextStyle(fontSize: 22),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    RegexInputFormatter(RegExp(r'[0-9]{1,8}')),
                  ],
                  onChanged: (String value) async {
                    if (value.length == 8) {
                      setState(() {
                        loading = true;
                      });
                      cepModel = await cepRepository.consultaCEP(value);
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  cepModel.logradouro ?? "",
                  style: const TextStyle(fontSize: 22),
                ),
                Text(
                  (cepModel.localidade == null) ? "" : "${cepModel.localidade}/${cepModel.uf}",
                  style: const TextStyle(fontSize: 22),
                ),
                if (loading) const CircularProgressIndicator()
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _addCEP,
            child: const Icon(Icons.add),
          ),
        )
    );
  }
}
