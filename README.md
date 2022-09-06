# basf_flutter_components

<p align="center">
  <img src="https://raw.githubusercontent.com/BASF-Mobile-Solutions/basf_flutter_components/master/assets/basf_logo.png" />
</p>

[![ci][ci_badge]][ci_link] [![pub package][pub_badge]][pub_link]  [![License: MIT][license_badge]][license_link] ![coverage][coverage_badge]


A BASF Piano Flutter plugin for Piano Analytics

## Installing

Add BASF Piano Flutter plugin to your pubspec.yaml file:

```yaml
dependencies:
  basf_flutter_pianoanalytics:
```

Import the library into your `.dart` file:

```dart
import 'package:piano_flutter_plugin/piano_flutter_plugin.dart';
```



## Piano Flutter SDK

- ### Init SDK

```dart
pianoFlutterPlugin = PianoFlutterPlugin();
```

- ### Config SDK

```dart
// config with domain and SiteId
pianoFlutterPlugin.config("your domain",000000);
```

#### Track event
```dart
pianoFlutterPlugin.trackEvent('page.display',{
        "page": "page name ios 09 05", // Event properties
        "page_chapter1": "chapter 1",
        "page_chapter2": "chapter 2",
        "page_chapter3": "chapter 3"
      });
/// etc...
```

You can find how to use all of this components at the example project

[pub_badge]: https://img.shields.io/pub/v/basf_flutter_components.svg?label=basf_flutter_components
[pub_link]: https://pub.dev/packages/basf_flutter_components

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

[license_badge]: https://img.shields.io/badge/license-BSD%203-green.svg
[license_link]: https://opensource.org/licenses/BSD-3-Clause

[coverage_badge]: https://raw.githubusercontent.com/BASF-Mobile-Solutions/basf_flutter_components/master/coverage_badge.svg

[ci_badge]: https://github.com/BASF-Mobile-Solutions/basf_flutter_components/workflows/publish/badge.svg
[ci_link]: https://github.com/BASF-Mobile-Solutions/basf_flutter_components/actions
