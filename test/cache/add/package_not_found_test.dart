// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';

import 'package:pub/src/exit_codes.dart' as exit_codes;

import '../../test_pub.dart';

main() {
  test('fails if the package cound not be found on the source', () async {
    await serveNoPackages();

    await runPub(
        args: ["cache", "add", "foo"],
        error: new RegExp(r"Could not find package foo at http://.*"),
        exitCode: exit_codes.UNAVAILABLE);
  });
}
