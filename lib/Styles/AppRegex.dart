class AppRegex {
  static get versionPattern =>
      RegExp(r"^version: .*$", multiLine: true, caseSensitive: true);

  static RegExp get MatchWholeLine => RegExp("^!.*");

  static dependencyPattern(String packageName) =>
      RegExp("${packageName}*:", multiLine: true, caseSensitive: true);
}

String sampleVersion = "version: 2.5.1+13";
String sampleDependency = '''
  cupertino_icons: ^0.1.2
  sample_data: ^0.1.0
  font_awesome:
  faker: ^1.0.1
  google_maps_flutter: ^0.5.16
  font_awesome_flutter:
  ''';

main() {
  var sampleText = sampleDependency;
  RegExp regExp = AppRegex.dependencyPattern("google_maps_flutter");
  print("allMatches : " + regExp.allMatches("${sampleText}").toString());
  print("firstMatch : " + regExp.firstMatch("${sampleText}").toString());
  print("hasMatch : " + regExp.hasMatch("${sampleText}").toString());
  print("stringMatch : " + regExp.stringMatch("${sampleText}").toString());
}
