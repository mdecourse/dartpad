          import "package:test/bootstrap/node.dart";

          import "inject_parser_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        