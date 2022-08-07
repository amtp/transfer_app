class AutcData {
  final bool result;
  final String key;
  final List<String> errors;

  const AutcData({
      this.result,
      this.key,
      this.errors,
  });

  factory AutcData.fromJson(Map<String, dynamic> json) {
    return AutcData(
      result: json['result'],
      key: json['key'],
      errors: json['errors'],
    );
  }
}