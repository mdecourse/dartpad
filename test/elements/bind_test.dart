// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library dartpad.bind_test;

import 'dart:async';

import 'package:dart_pad/elements/bind.dart';
import 'package:test/test.dart';

void main() => defineTests();

void defineTests() {
  group('bind', () {
    test('get stream changes', () {
      StreamController fromController = StreamController.broadcast();
      TestProperty to = TestProperty();
      bind(fromController.stream, to);
      fromController.add('foo');
      return to.onChanged.first.then((_) {
        expect(to.value, 'foo');
      });
    });

    test('get property changes', () {
      TestProperty from = TestProperty('foo');
      TestProperty to = TestProperty();
      bind(from, to).flush();
      return to.onChanged.first.then((_) {
        expect(to.value, from.value);
      });
    });

    test('target functions', () {
      TestProperty from = TestProperty('foo');
      Object val;
      var to = (_val) => val = _val;
      bind(from, to).flush();
      expect(val, from.value);
    });

    test('target properties', () {
      TestProperty from = TestProperty('foo');
      TestProperty to = TestProperty();
      bind(from, to).flush();
      return to.onChanged.first.then((_) {
        expect(to.value, from.value);
      });
    });

    test('can cancel', () {
      TestProperty from = TestProperty();
      TestProperty to = TestProperty();
      Binding binding = bind(from, to);
      from.set('foo');
      binding.cancel();
      from.set('bar');
      return Future.delayed(Duration.zero, () {
        expect(to.value, 'foo');
      });
    });
  });
}

class TestProperty implements Property {
  final _controller = StreamController(sync: true);
  Object value;
  int changedCount = 0;

  TestProperty([this.value]);

  @override
  dynamic get() => value;

  @override
  void set(val) {
    value = val;
    changedCount++;
    _controller.add(value);
  }

  @override
  Stream get onChanged => _controller.stream;
}
