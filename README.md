PhoenixTV
=========

A sample AppleTV tvOS application which works with the Phoenix Chat Server sample app.

## Setup

Install the SwiftPhoenixClient pod. It's already in `PhoenixTV/Podfile` file.

If you try to build the application, you'll immediately see the following error:
````
Target 'Pods' of project 'Pods' was rejected as an implicit dependency for 'Pods.framework' because it doesn't contain platform 'appletvsimulator' in its SUPPORTED_PLATFORMS 'iphonesimulator, iphoneos'
````

In order to fix this, you must go to the `Pods` target's `Build Settings` and change the `Suggested Platforms` to `tvOS` (from OS X).

The app should now build without errors. The app expects the Phoenix Chat Server to be running on `localhost:4000`.

## Notes

This has been tested against Swift 2.0, Xcode 7.1, and Phoenix 1.0.1.

## License

See LICENSE file for MIT License.