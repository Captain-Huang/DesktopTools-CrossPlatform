enum AppErrorType { network, database, validation, unknown }

class AppError implements Exception {
  const AppError({
    required this.type,
    required this.message,
    this.original,
  });

  final AppErrorType type;
  final String message;
  final Object? original;

  @override
  String toString() => 'AppError(type: $type, message: $message)';
}

