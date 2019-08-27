          import "package:test/bootstrap/node.dart";

          import "dependencies_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        