class CEPsModel {
  List<CEPModel> ceps = [];

  CEPsModel(ceps);

  CEPsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <CEPModel>[];
      json['results'].forEach((v) {
        ceps.add(CEPModel.fromJson(v));
      });
    }
  }
}

class CEPModel {
  String? objectId;
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  CEPModel(
      {String? objectId,
        String? cep,
        String? logradouro,
        String? complemento,
        String? bairro,
        String? localidade,
        String? uf,
        String? ibge,
        String? gia,
        String? ddd,
        String? siafi}) {
    if (objectId != null) {
      objectId = objectId;
    }
    if (cep != null) {
      cep = cep;
    }
    if (logradouro != null) {
      logradouro = logradouro;
    }
    if (complemento != null) {
      complemento = complemento;
    }
    if (bairro != null) {
      bairro = bairro;
    }
    if (localidade != null) {
      localidade = localidade;
    }
    if (uf != null) {
      uf = uf;
    }
    if (ibge != null) {
      ibge = ibge;
    }
    if (gia != null) {
      gia = gia;
    }
    if (ddd != null) {
      ddd = ddd;
    }
    if (siafi != null) {
      siafi = siafi;
    }
  }

  CEPModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }
}