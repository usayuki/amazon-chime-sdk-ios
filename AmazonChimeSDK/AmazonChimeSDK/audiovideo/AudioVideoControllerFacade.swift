//
//  AudioVideoControllerFacade.swift
//  AmazonChimeSDK
//
//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0
//

import AmazonChimeSDKMedia
import Foundation
import UIKit

/// `AudioVideoControllerFacade` manages the signaling and peer connections.
@objc public protocol AudioVideoControllerFacade {
    var configuration: MeetingSessionConfiguration { get }
    var logger: Logger { get }
    /// Start AudioVideo Controller
    ///
    /// - Parameter callKitEnabled: A Bool value to indicate whether the VoIP call to start has CallKit integration.
    /// This parameter is used to determine how audio session interruptions should be handled,
    /// in scenarios such as receving another phone call during the VoIP call.
    /// - Throws: `PermissionError.audioPermissionError` if `RecordPermission` is not given
    func start(callKitEnabled: Bool, delegate: VideoClientDelegate?) throws

    /// Start AudioVideo Controller
    ///
    /// - Throws: `PermissionError.audioPermissionError` if `RecordPermission` is not given
    func start(delegate: VideoClientDelegate?) throws

    /// Stop AudioVideo Controller. This will exit the meeting
    func stop()

    /// Enable self video to start streaming
    ///
    /// - Throws: `PermissionError.videoPermissionError` if video permission of `AVCaptureDevice` is not granted
    func startLocalVideo() throws

    /// Disable self video streaming
    func stopLocalVideo()

    /// Enable remote video to start receiving streams
    func startRemoteVideo()

    /// Disable remote video to stop receiving streams
    func stopRemoteVideo()

    /// Subscribe to audio, video, and connection events with an `AudioVideoObserver`.
    ///
    /// - Parameter observer: The observer to subscribe to events with
    func addAudioVideoObserver(observer: AudioVideoObserver)

    /// Unsubscribes from audio, video, and connection events by removing specified `AudioVideoObserver`.
    ///
    /// - Parameter observer: The observer to unsubscribe from events with
    func removeAudioVideoObserver(observer: AudioVideoObserver)

    /// Subscribe to metrics events with an `MetricsObserver`.
    ///
    /// - Parameter observer: The observer to subscribe to events with
    func addMetricsObserver(observer: MetricsObserver)

    /// Unsubscribes from metrics events by removing specified `MetricsObserver`.
    ///
    /// - Parameter observer: The observer to unsubscribe from events with
    func removeMetricsObserver(observer: MetricsObserver)

    func didReceive(buffer: CVPixelBuffer?, profileId: String!, pauseState: PauseState, videoId: UInt32)
    func videoClientIsConnecting(client: VideoClient?)
    func videoClientDidConnect(client: VideoClient?, controlStatus: Int32)
    func videoClientDidFail(client: VideoClient?, status: video_client_status_t, controlStatus: Int32)
    func videoClientDidStop(client: VideoClient?)
    func videoClient(client: VideoClient?, cameraSendIsAvailable available: Bool)
    func videoClientRequestTurnCreds(videoClient: VideoClient?)
    func videoClientMetricsReceived(metrics: [AnyHashable: Any]?)
}
