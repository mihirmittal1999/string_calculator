class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Split with any non-digit character
    final splitNumbers = numbers.split(RegExp(r'[^\d-]'));

    final parsedNumbers = <int>[];
    for (var num in splitNumbers) {
      if (num.isNotEmpty) {
        parsedNumbers.add(int.parse(num));
      }
    }

    // Throw error if negative numbers found
    final negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(",")}');
    }

    return parsedNumbers.fold(0, (sum, n) => sum + n);
  }
}
