          import "package:test/bootstrap/browser.dart";

          import "mutable_gist_test.dart" as test;

          void main() {
            internalBootstrapBrowserTest(() => test.main);
          }
        