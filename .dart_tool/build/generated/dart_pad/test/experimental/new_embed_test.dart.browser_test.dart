          import "package:test/bootstrap/browser.dart";

          import "new_embed_test.dart" as test;

          void main() {
            internalBootstrapBrowserTest(() => test.main);
          }
        