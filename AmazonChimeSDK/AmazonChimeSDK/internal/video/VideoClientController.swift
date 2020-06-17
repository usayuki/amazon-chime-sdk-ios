//
//  VideoClientController.swift
//  AmazonChimeSDK
//
//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0
//

import AmazonChimeSDKMedia
import Foundation
import UIKit

@objc public protocol VideoClientController {
    func start(turnControlUrl: String,
               signalingUrl: String,
               meetingId: String,
               joinToken: String,
               delegate: VideoClientDelegate?)
    func stopAndDestroy()
    func startLocalVideo() throws
    func stopLocalVideo()
    func startRemoteVideo()
    func stopRemoteVideo()
    func switchCamera()
    func getCurrentDevice() -> VideoDevice?
    func subscribeToVideoClientStateChange(observer: AudioVideoObserver)
    func unsubscribeToVideoClientStateChange(observer: AudioVideoObserver)
    func subscribeToVideoTileControllerObservers(observer: VideoTileController)
    func unsubscribeToVideoTileControllerObservers(observer: VideoTileController)
    func pauseResumeRemoteVideo(_ videoId: UInt32, pause: Bool)
    func didReceive(buffer: CVPixelBuffer?, profileId: String!, pauseState: PauseState, videoId: UInt32)
    func videoClientIsConnecting(client: VideoClient?)
    func videoClientDidConnect(client: VideoClient?, controlStatus: Int32)
    func videoClientDidFail(client: VideoClient?, status: video_client_status_t, controlStatus: Int32)
    func videoClientDidStop(client: VideoClient?)
    func videoClient(client: VideoClient?, cameraSendIsAvailable available: Bool)
    func videoClientRequestTurnCreds(videoClient: VideoClient?)
    func videoClientMetricsReceived(metrics: [AnyHashable: Any]?)
}
