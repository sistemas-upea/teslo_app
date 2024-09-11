import 'package:formz/formz.dart';

enum StockError { empty, value, format }

class Stock extends FormzInput<int, StockError> {
  const Stock.pure() : super.pure(0);

  const Stock.dirty(int value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == StockError.empty) return 'El campo es requerido';
    if (displayError == StockError.value) {
      return 'Tiene que ser un número mayor o igual a cero';
    }
    if (displayError == StockError.format) return 'No tiene formato de número';

    return null;
  }

  @override
  StockError? validator(int value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return StockError.empty;
    }
    final isInteger = int.tryParse(value.toString()) ?? -1;
    if (isInteger == -1) return StockError.format;
    if (value < 0) return StockError.value;
    return null;
  }
}
