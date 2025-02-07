# patrol_cli

[![patrol_cli on pub.dev][pub_badge]][pub_link]
[![codestyle][pub_badge_style]][pub_badge_link]

Command-line tool to make working with [patrol][pub_link_test] easier.

## Installation

### From pub.dev

```console
$ dart pub global activate patrol_cli
```

### From git

1. Make sure that you have Dart >= 2.17 installed.

   ```console
   $ dart --version
   ```

2. Clone the repo.
3. Go to `packages/patrol_cli`.
4. Run `dart pub global activate --source path .`

### Troubleshooting

If you can't run `patrol` from the terminal and the error is something along the
lines of "command not found", make sure that you've added appropriate
directories to PATH:

- on Unix-like systems, add `$HOME/.pub-cache/bin`
- on Windows, add `%USERPROFILE%\AppData\Local\Pub\Cache\bin`

## Usage

### First run

On first run, `patrol_cli` will download artifacts it needs to the _artifact
path_. By default it is `$XDG_CACHE_HOME` (on Unix-like systems) or
`$HOME/.patrol` (on Windows), but you can change it by setting `PATROL_CACHE`
environment variable.

To learn about commands, run:

```console
$ patrol --help
```

### Bootstrap

To use Patrol in your Flutter project, you need to:

1. add `patrol` as a `dev_dependency` in `pubspec.yaml`
1. add `integration_test` as a `dev_dependency` in `pubspec.yaml`
1. create `test_driver/integration_test.dart`
1. create `integration_test/app_test.dart`

Run `patrol bootstrap` to automatically perform these steps.

### First drive

Make sure that you have at least one device attached:

```console
$ patrol devices
```

To run the simple integration test generated by `patrol bootstrap`:

```console
$ patrol drive
```

[pub_badge]: https://img.shields.io/pub/v/patrol_cli.svg
[pub_link]: https://pub.dartlang.org/packages/patrol_cli
[pub_link_test]: https://pub.dartlang.org/packages/patrol
[pub_badge]: https://img.shields.io/pub/v/patrol_cli.svg
[pub_link]: https://pub.dartlang.org/packages/patrol_cli
[pub_badge_style]: https://img.shields.io/badge/style-leancode__lint-black
[pub_badge_link]: https://pub.dartlang.org/packages/leancode_lint
