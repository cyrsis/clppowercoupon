import 'package:clppowercoupon/generated/l10n.dart';
import 'package:flutter/material.dart';

class IntlRepo {

  void ChangeToEN () {
    S.load(Locale("en", ""));
  }

  void ChangeToCHT () {
    S.load(Locale("zh", "HK"));
  }
}