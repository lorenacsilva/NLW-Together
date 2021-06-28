import 'dart:ffi';

import 'package:counter_app/shared/models/boleto_model.dart';
import 'package:flutter/cupertino.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange(
      {String? name, String? dueDAte, double? value, String? barcode}) {
    model = model.copyWith(
        name: name, dueDate: dueDAte, value: value, barcode: barcode);
  }

  void cadastrarBoleto() {
    final form = formKey.currentState;
    if (form!.validate()) {}
  }
}
