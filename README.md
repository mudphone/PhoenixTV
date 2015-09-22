PhoenixTV
=========

![Behold! Phoenix TV!](https://raw.githubusercontent.com/mudphone/PhoenixTV/master/Docs/images/NeedMoreButton.png)

A sample AppleTV tvOS application which works with the [Phoenix Chat Example](https://github.com/chrismccord/phoenix_chat_example) app.

## Setup

The current verwion of the SwiftPhoenixClient doesn't support tvOS (Swift 2.0, Xcode 7.1). You'll need a local copy of the [SwiftPhoenixClient's swift2_0 branch](https://github.com/mudphone/SwiftPhoenixClient/tree/swift2_0) (which works with tvOS). You'll install it as a CocoaPod, but your Podfile will contain a local path to your copy. Update the `PhoenixTV/Podfile` file with a valid path to the location of your copy of the SwiftPhoenixClient's swift2_0 branch.

(When the [official SwiftPhoenixClient](https://github.com/davidstump/SwiftPhoenixClient) is updated, the local CocoaPod install will not be necessary.)

Install the SwiftPhoenixClient pod by changing into the Podfile directory and running `pod install`.

After the pod is installed, if you try to build the application, you'll immediately see the following error:
![Supported Platforms error](https://raw.githubusercontent.com/mudphone/PhoenixTV/master/Docs/images/error_supported_platforms.png)

In order to fix this, you must go to the `Pods` target's `Build Settings` and change the `Suggested Platforms` to `tvOS` (from OS X).
![Supported Platforms fix](https://raw.githubusercontent.com/mudphone/PhoenixTV/master/Docs/images/fix_supported_platforms.png)

The app should now build without errors. The app expects the [Phoenix Chat Example](https://github.com/chrismccord/phoenix_chat_example) server to be running on `localhost:4000`.

## Notes

This has been tested against Swift 2.0, Xcode 7.1, and Phoenix 1.0.1.

## License

See LICENSE file for MIT License.