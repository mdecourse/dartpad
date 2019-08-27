// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:dart_pad/experimental/new_embed.dart';
import 'package:logging/logging.dart';

void main() {
  init(NewEmbedOptions(NewEmbedMode.dart));

  Logger.root.onRecord.listen(print);
}
