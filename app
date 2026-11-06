name: Build
on: [workflow_dispatch, push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: unzip -q ShizukuShell.zip
      - uses: actions/setup-java@v4
        with: { distribution: temurin, java-version: 17 }
      - uses: gradle/actions/setup-gradle@v4
        with: { gradle-version: 8.7 }
      - run: gradle assembleDebug
        working-directory: ShizukuShell
      - uses: actions/upload-artifact@v4
        with:
          name: apk
          path: ShizukuShell/app/build/outputs/apk/debug/*.apk
