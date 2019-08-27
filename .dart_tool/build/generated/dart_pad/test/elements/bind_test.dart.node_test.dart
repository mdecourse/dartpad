          import "package:test/bootstrap/node.dart";

          import "bind_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        