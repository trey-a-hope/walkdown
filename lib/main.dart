import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:walkdown/presentation/games/walkdown_game.dart';

late Logger logger;

void main() async {
  logger = Logger(printer: PrefixPrinter(PrettyPrinter()));

  runApp(const WalkdownGame());
}
