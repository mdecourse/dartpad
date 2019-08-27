          import "package:test/bootstrap/browser.dart";

          import "bind_test.dart" as test;

          void main() {
            internalBootstrapBrowserTest(() => test.main);
          }
        