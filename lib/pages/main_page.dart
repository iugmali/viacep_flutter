import 'package:flutter/material.dart';
import 'package:viacep_flutter/pages/ceps_page.dart';
import 'package:viacep_flutter/pages/consulta_cep_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ViaCEP Flutter"),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  ConsultaCEPPage(),
                  CEPsPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Consulta", icon: Icon(Icons.search)),
                  BottomNavigationBarItem(
                      label: "CEPs", icon: Icon(Icons.list)),
                ])
          ],
        ),
      ),
    );
  }
}
