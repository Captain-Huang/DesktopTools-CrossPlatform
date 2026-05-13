import 'package:desktop_tools_flutter/application/calculator/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({super.key});

  static const List<String> _keys = [
    'sin(',
    'cos(',
    'tan(',
    'ln(',
    'log(',
    'sqrt(',
    '(',
    ')',
    '^',
    'π',
    'e',
    'C',
    '7',
    '8',
    '9',
    '÷',
    '%',
    '⌫',
    '4',
    '5',
    '6',
    '×',
    '1/',
    '!',
    '1',
    '2',
    '3',
    '-',
    '.',
    '=',
    '0',
    '00',
    ',',
    '+',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculatorControllerProvider);
    final controller = ref.read(calculatorControllerProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final panelWidth = constraints.maxWidth.clamp(360.0, 560.0).toDouble();
        return Center(
          child: SingleChildScrollView(
            child: Container(
              width: panelWidth,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF2F6FD), Color(0xFFE4ECFA)],
                ),
                border: Border.all(color: const Color(0xFFB9CBE6), width: 1.2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x22000000),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF101A2A),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          state.expression.isEmpty ? '0' : state.expression,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF9DB0CB),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          state.result,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (state.error?.isNotEmpty == true)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              state.error!,
                              style: const TextStyle(color: Color(0xFFFFA5A5), fontSize: 11),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _keys.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      childAspectRatio: 2.3,
                    ),
                    itemBuilder: (_, i) {
                      final key = _keys[i];
                      final isOperator = const {
                        '÷',
                        '×',
                        '-',
                        '+',
                        '=',
                        'C',
                        '⌫',
                      }.contains(key);
                      return FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: isOperator ? const Color(0xFF2A69FF) : const Color(0xFFF8FBFF),
                          foregroundColor: isOperator ? Colors.white : const Color(0xFF1D304C),
                          elevation: 0,
                          side: isOperator ? BorderSide.none : const BorderSide(color: Color(0xFFD5E3F8)),
                          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                          textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => _onKeyPressed(controller, key),
                        child: Text(key),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onKeyPressed(CalculatorController controller, String key) {
    switch (key) {
      case 'C':
        controller.clear();
        return;
      case '⌫':
        controller.backspace();
        return;
      case '=':
        controller.evaluate();
        return;
      case '1/':
        controller.input('1/(');
        return;
      case '%':
        controller.input('/100');
        return;
      case ',':
        return;
      case '!':
        controller.input('!');
        return;
      default:
        controller.input(key);
        return;
    }
  }
}

