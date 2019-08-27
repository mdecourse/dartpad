          import "package:test/bootstrap/browser.dart";

          import "inject_parser_test.dart" as test;

          void main() {
            internalBootstrapBrowserTest(() => test.main);
          }
        