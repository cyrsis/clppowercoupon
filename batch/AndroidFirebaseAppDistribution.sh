#!/usr/bin/env bash


cd ..

flutter clean
#
flutter build apk --release

cd android

bundle exec fastlane upload_to_firebase
#fastlane upload_to_firebase

