install-flutter:
	cd example && flutter packages get

install-android:
	cd example/android && ./gradlew clean && ./gradlew assembleRelease

install-ios:
	cd example/ios && pod install

install: install-flutter install-android install-ios

watch:
	cd example && flutter packages pub puzzle xdml --config=puzzle.config.yaml