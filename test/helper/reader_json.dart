import 'dart:io';

String fixture(String name) => File('test/json/$name').readAsStringSync();