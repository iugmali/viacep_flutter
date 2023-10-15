import 'package:viacep_flutter/models/cep_model.dart';
import 'package:viacep_flutter/utils/dio/back4app..dart';
import 'package:viacep_flutter/utils/dio/viacep.dart';

class CEPRepository {
  final _back4App = Back4App();
  final _viaCEP = ViaCEP();

  CEPRepository();

  Future<CEPModel> consultaCEP(String cep) async {
    var result = await _viaCEP.dio.get("/$cep/json");
    if (result.statusCode == 200) {
      return CEPModel.fromJson(result.data);
    }
    return CEPModel();
  }

  Future<CEPsModel> list() async {
    var result = await _back4App.dio.get("/");
    return CEPsModel.fromJson(result.data);
  }

  Future<void> add(CEPModel cepModel) async {
    try {
      await _back4App.dio.post("/", data: cepModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(CEPModel cepModel) async {
    try {
      await _back4App.dio.put("/${cepModel.objectId}", data: cepModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remove(String objectId) async {
    try {
      await _back4App.dio.delete("/$objectId",);
    } catch (e) {
      rethrow;
    }
  }

}