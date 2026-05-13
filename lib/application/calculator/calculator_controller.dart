import 'dart:math';

import 'package:desktop_tools_flutter/core/error/error_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorState {
  const CalculatorState({
    required this.expression,
    required this.result,
    this.error,
  });

  final String expression;
  final String result;
  final String? error;

  CalculatorState copyWith({
    String? expression,
    String? result,
    String? error,
  }) {
    return CalculatorState(
      expression: expression ?? this.expression,
      result: result ?? this.result,
      error: error,
    );
  }
}

final calculatorControllerProvider =
    StateNotifierProvider<CalculatorController, CalculatorState>((_) {
      return CalculatorController();
    });

class CalculatorController extends StateNotifier<CalculatorState> {
  CalculatorController()
    : super(const CalculatorState(expression: '', result: '0'));

  void input(String token) {
    state = state.copyWith(expression: '${state.expression}$token', error: null);
  }

  void clear() {
    state = const CalculatorState(expression: '', result: '0');
  }

  void backspace() {
    if (state.expression.isEmpty) return;
    state = state.copyWith(
      expression: state.expression.substring(0, state.expression.length - 1),
      error: null,
    );
  }

  void evaluate() {
    try {
      final exp = _normalizeExpression(state.expression);
      if (exp.trim().isEmpty) return;
      final parser = ShuntingYardParser();
      final expression = parser.parse(exp);
      final cm = ContextModel()
        ..bindVariableName('pi', Number(pi))
        ..bindVariableName('e', Number(e));
      final value = expression.evaluate(EvaluationType.REAL, cm);
      final text = value.toStringAsFixed(10).replaceFirst(RegExp(r'\.?0+$'), '');
      state = state.copyWith(result: text, error: null);
    } catch (e) {
      state = state.copyWith(error: ErrorMessage.fromException(e).message);
    }
  }

  String _normalizeExpression(String input) {
    return input
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('π', 'pi');
  }
}
