class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numbersPart = numbers;

    // Custom delimiter support
    if (numbers.startsWith('//')) {
      int delimiterEndIndex = numbers.indexOf('\n');
      delimiter = numbers.substring(2, delimiterEndIndex);
      numbersPart = numbers.substring(delimiterEndIndex + 1);
    }

    // Split with comma, newline, or custom delimiter
    final splitNumbers = numbersPart.split(RegExp('[\n$delimiter,]'));

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
