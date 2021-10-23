import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pupaadmin/core/widgets/buttons/rounded_elevated_button.dart';
import 'package:pupaadmin/core/widgets/errors/form_error.dart';
import 'package:pupaadmin/core/widgets/loading.dart';



class ConfirmDeletionDialog extends StatefulWidget {
  final String type;
  final String confirmText;
  final Future<bool> Function() onSubmit;
  const ConfirmDeletionDialog({
    Key? key,
    required this.type,
    required this.confirmText,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<ConfirmDeletionDialog> createState() => _ConfirmDeletionDialogState();
}

class _ConfirmDeletionDialogState extends State<ConfirmDeletionDialog> {
  bool _loading = false;
  String? _error;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (_loading) return const ModalLoadingScreen();
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 400,
        height: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SHOULD ADD A WARNING FLAG
              //Placeholder

              const Text(
                '¡Advertencia!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text:
                              'Esta a punto de eliminar una pieza de informacion imporante ('),
                      TextSpan(
                        text: widget.type,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ') escriba el siguiente texto: '),
                      TextSpan(
                        text: widget.type + '/' + widget.confirmText,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ' y haga click/tab en confirmar')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Escriba la informacion solicitada',
                  ),
                  validator: (str) =>
                      str != widget.type + '/' + widget.confirmText
                          ? 'El texto introducido no es igual al requerido'
                          : null,
                ),
              ),

              FormError(error: _error),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedElevatedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  RoundedElevatedButton(
                    color: Theme.of(context).errorColor,
                    onPressed: () async {
                      if (!_key.currentState!.validate()) return;
                      setState(() => _loading = true);
                      if (await widget.onSubmit()) {
                        return Navigator.of(context).pop();
                      }
                      setState(() {
                        _loading = false;
                        _error =
                            'Ha ocurrido un error inesperado al intentar ejecutar esta accion, por favor intente mas tarde';
                      });
                    },
                    child: const Text('Eliminar'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
