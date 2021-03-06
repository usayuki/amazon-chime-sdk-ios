## [0.8.1] - 2020-07-31
- Added data message API

## [0.8.0] - 2020-07-20

### Added
- **Breaking** Added `videoTileSizeDidChange` API in `VideoTileObserver` for video stream content size change
- **Breaking** Added `isLocalTile` to constructor of `DefaultVideoTile` and `VideoTileState`
- CallKit integration in demo app. Added options to join meeting as incoming or outgoing call. Since our demo app does not have Push Notification for incoming calls, we mimic the behavior by delaying reporting incoming calls to give user time to background the app or lock screen.
- Added icons and launch screen for demo app
- Added attendee id to local video tile

### Changed
- **Breaking** Throw MediaError.audioFailedToStart when AudioClient fails to start
- **Breaking** Changed the constructor for `DefaultVideoTileController` 
- Changed UI for iOS demo app
- `DefaultVideoRenderView` now supports dynamically changing `contentMode` at run time.
- Changed video render frame type from `Any?` to `CVPixelBuffer?`

## [0.7.1] - 2020-06-24

### Changed
- `DefaultAudioClientController` no longer defaults to Speaker as audio output when starting audio session.

## [0.7.0] - 2020-06-05

### Added
- **Breaking** Added `start(callKitEnabled:)` in `AudioVideoControllerFacade` to accept a Bool type `callKitEnabled` parameter, which is set to `false` by default in `DefaultAudioVideoFacade`. Pass in `true` if your VoIP call has CallKit integration so that audio session interruptions are properly handled by the SDK.

### Changed
- `start()` in `DefaultAudioVideoFacade` now assumes the VoIP call to start has no CallKit integration by default to properly handle audio session interruptions. Use `start(callKitEnabled:)` to override the default behavior for calls that have CallKit integration.
- Initializers of all the public SDK classes are now publicly accessible to builders.

### Fixed
- Fixed random crashes caused by concurrency issues.

## [0.6.1] - 2020-05-22

### Added
- **Breaking** Added `attendeesDidDrop` API in `RealtimeObserver` for attendee who got dropped

## [0.6.0] - 2020-05-14

### Added
- **Breaking** Added additional fields for `CreateAttendeeResponse` and `CreateMeetingResponse`
- **Breaking** Added `audioSessionDidDrop` API in `AudioVideoObserver` for temporary disconnects
- Added `Versioning` class and `sdkVersion` API for retrieving current version of SDK
- Added `init(frame: CGRect)` initializer in `DefaultVideoRenderView` to properly initialize `DefaultVideoRenderView` in ObjC code.
- Added basic video features and `MetricsObserver` callback handler in the ObjC demo app.
- Added multiple video tiles support in Swift demo app.
- Added attendee name label in Swift demo app.
- Added new parameter `urlRewriter` in `MeetingSessionConfiguration` for customizing url

### Changed
- Updated demo app to work with updated [amazon-chime-sdk-js serverless demo](https://github.com/aws/amazon-chime-sdk-js/tree/master/demos/serverless). Note that you will need to redeploy the serverless demo to work with the updated demo app
- Updated methods for `AudioVideoObserver`, `RealtimeObserver`, `DeviceChangeObserver`, `VideoTileObserver`, and `MetricsObserver` to be called on main thread. Make sure to dispatch long-running tasks to another thread to avoid blocking the main thread.

### Fixed
- Fixed main thread freezing issue caused by calling `stop()` when in reconnecting state
- Fixed a bug where `audioSessionDidStopWithStatus()` was not getting called after calling `stop()`
- Fixed an issue in `bindVideoView()`, unbind first to prevent unexpected side effect.
- Fixed an issue that blocked user from removing paused video tiles.

## [0.5.2] - 2020-04-28

### Changed
- Turn on library evolution and module stability

## [0.5.1] - 2020-04-23

### Added
- Added full bitcode support in `AmazonChimeSDKMedia.framework` and `AmazonChimeSDK.framework`. Also added corresponding versions without bitcode. Links can be found in the README file.

### Fixed
- Fix bug where external id for self is sometimes empty

## [0.5.0] - 2020-03-27

### Changed
- Enable BUILD_LIBRARY_FOR_DISTRIBUTION to add Xcode 11.4 (Swift 5.2) support

## [0.4.0] - 2020-03-24
