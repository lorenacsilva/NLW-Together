import 'package:counter_app/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:counter_app/shared/themes/app_colors.dart';
import 'package:counter_app/shared/themes/app_text_styles.dart';
import 'package:counter_app/shared/widgets/input_text/input_text_widget.dart';
import 'package:counter_app/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text =
          widget.barcode!; //ler leitor e colocar automaticamente
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        // resolve problema de payflow
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
                child: Text(
                  "Preencha os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        label: "Nome do boleto",
                        icon: Icons.description_outlined,
                        validator: controller.validateName,
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                        initialValue: true,
                      ),
                      InputTextWidget(
                        controller: dueDateInputTextController,
                        label: "Vencimento",
                        icon: FontAwesomeIcons.timesCircle,
                        validator: controller.validateVencimento,
                        onChanged: (value) {
                          controller.onChange(dueDAte: value);
                        },
                        initialValue: true,
                      ),
                      InputTextWidget(
                        controller: moneyInputTextController,
                        label: "Valor",
                        icon: FontAwesomeIcons.wallet,
                        validator: (_) => controller.validateValor(
                            moneyInputTextController.numberValue),
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                        initialValue: true,
                      ),
                      InputTextWidget(
                        controller: barcodeInputTextController,
                        label: "Código",
                        icon: FontAwesomeIcons.barcode,
                        validator: controller.validateCodigo,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                        initialValue: true,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        enableSecondaryColor: true,
        labelPrimary: "Cancelar",
        onTapPrimary: () {
          Navigator.pop(context); //volta na tela anterior
        },
        labelSecondary: "Cadastrar",
        onTapSecondary: () {
          controller.cadastrarBoleto();
        },
      ),
    );
  }
}
