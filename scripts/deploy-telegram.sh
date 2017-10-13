#!/usr/bin/env sh

# Lawnchair
cp app/build/outputs/apk/debug/app-debug.apk Lawnchair-$MAJOR_MINOR.$TRAVIS_BUILD_NUMBER.apk
cp app/build/outputs/mapping/debug/mapping.txt proguard-$MAJOR_MINOR.$TRAVIS_BUILD_NUMBER.txt

curl -F chat_id="-1001141434698" -F document=@"Lawnchair-$MAJOR_MINOR.$TRAVIS_BUILD_NUMBER.apk" https://api.telegram.org/bot$BOT_TOKEN/sendDocument
curl -F chat_id="-1001141434698" -F text="$(./scripts/changelog.sh)" -F parse_mode="HTML" https://api.telegram.org/bot$BOT_TOKEN/sendMessage
curl -F chat_id="152559768" -F document=@"proguard-$MAJOR_MINOR.$TRAVIS_BUILD_NUMBER.txt" https://api.telegram.org/bot$BOT_TOKEN/sendDocument


# Lawnfeed
cp lawnfeed/build/outputs/apk/debug/app-debug.apk Lawnfeed-$MAJOR_MINOR.$TRAVIS_BUILD_NUMBER.apk
curl -F chat_id="-1001141434698" -F document=@"Lawnfeed-$MAJOR_MINOR.$TRAVIS_BUILD_NUMBER.apk" https://api.telegram.org/bot$BOT_TOKEN/sendDocument