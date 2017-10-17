// SBTUITunneledApplication.h
//
// Copyright (C) 2016 Subito.it S.r.l (www.subito.it)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#if DEBUG
    #ifndef ENABLE_UITUNNEL 
        #define ENABLE_UITUNNEL 1
    #endif
#endif

#if ENABLE_UITUNNEL

#import <XCTest/XCTest.h>
#import "SBTRequestMatch.h"
#import "SBTStubResponse.h"
#import "SBTMonitoredNetworkRequest.h"

@interface SBTUITunneledApplication : XCUIApplication

/**
 *  Launch application synchronously waiting for the tunnel server connection to be established.
 */
- (void)launchTunnel;

/**
 *  Launch application synchronously waiting for the tunnel server connection to be established.
 *
 *  @param startupBlock Block that is executed before connection is estabilished.
 *  Useful to inject startup condition (user settings, preferences).
 *  Note: commands sent in the completionBlock will return nil
 */
- (void)launchTunnelWithStartupBlock:(nullable void (^)(void))startupBlock;

/**
 *  Launch application synchronously waiting for the tunnel server connection to be established.
 *
 *  @param options List of options to be passed on launch.
 *  Valid options:
 *  SBTUITunneledApplicationLaunchOptionResetFilesystem: delete app's filesystem sandbox
 *  SBTUITunneledApplicationLaunchOptionDisableUITextFieldAutocomplete disables UITextField's autocomplete functionality which can lead to unexpected results when typing text.
 *
 *  @param startupBlock Block that is executed before connection is estabilished.
 *  Useful to inject startup condition (user settings, preferences).
 *  Note: commands sent in the completionBlock will return nil
 */
- (void)launchTunnelWithOptions:(nonnull NSArray<NSString *> *)options startupBlock:(nullable void (^)(void))startupBlock;

#pragma mark - Timeout

/**
 *  Change the default timeout for the tunnel connection. Should be used only as a workaround when using the tunnel on very slow hardwares
 *
 *  @param timeout Timeout in seconds
 */
+ (void)setConnectionTimeout:(NSTimeInterval)timeout;

#pragma mark - Quit Command

/**
 *  Quits application by sending an abort(). Useful to use in tearDown() to make sure the current test ends
 */
- (void)quit;

#pragma mark - Stub Commands

/**
 *  Stub a request matching a regular expression pattern. The rule is checked against the URL.absoluteString of the request
 *
 *  @param match The match object that contains the matching rules
 *  @param response The object that represents the stubbed response
 *
 *  @return If nil request failed. Otherwise an identifier associated to the newly created stub. Should be used when removing stub using -(BOOL)stubRequestsRemoveWithId:
 */
- (nullable NSString *)stubRequestsMatching:(nonnull SBTRequestMatch *)match response:(nonnull SBTStubResponse *)response;

#pragma mark - Stub And Remove Commands

/**
 *  Stub a request matching a regular expression pattern for a limited number of times. The rule is checked against the URL.absoluteString of the request
 *
 *  @param match The match object that contains the matching rules
 *  @param response The object that represents the stubbed response
 *  @param iterations number of matches after which the stub will be automatically removed
 *
 *  @return `YES` on success
 */
- (nullable NSString *)stubRequestsMatching:(nonnull SBTRequestMatch *)match response:(nonnull SBTStubResponse *)response removeAfterIterations:(NSUInteger)iterations;

#pragma mark - Stub Remove Commands

/**
 *  Remove a specific stub
 *
 *  @param stubId The identifier that was returned when adding the stub
 *
 *  @return `YES` on success If `NO` the specified identifier wasn't associated to an active stub or request failed
 */
- (BOOL)stubRequestsRemoveWithId:(nonnull NSString *)stubId;

/**
 *  Remove a list of stubs
 *
 *  @param stubIds The identifiers that were returned when adding the stub
 *
 *  @return `YES` on success If `NO` one of the specified identifier were not associated to an active stub or request failed
 */
- (BOOL)stubRequestsRemoveWithIds:(nonnull NSArray<NSString *> *)stubIds;

/**
 *  Remove all active stubs
 *
 *  @return `YES` on success
 */
- (BOOL)stubRequestsRemoveAll;

#pragma mark - Monitor Requests Commands

/**
 *  Start monitoring requests matching a regular expression pattern. The rule is checked against the URL.absoluteString of the request.
 *
 *  The monitored events can be successively polled using the monitoredRequestsFlushAll method.
 *
 *  @param match The match object that contains the matching rules
 *
 *  @return If nil request failed. Otherwise an identifier associated to the newly created monitor probe. Should be used when using -(BOOL)monitorRequestRemoveWithId:
 */
- (nullable NSString *)monitorRequestsMatching:(nonnull SBTRequestMatch *)match;

/**
 *  Peek (retrieve) the current list of collected requests
 *
 *  @return The list of monitored requests
 */
- (nonnull NSArray<SBTMonitoredNetworkRequest *> *)monitoredRequestsPeekAll;

/**
 *  Flushes (retrieve + clear) the current list of collected requests
 *
 *  @return The list of monitored requests
 */
- (nonnull NSArray<SBTMonitoredNetworkRequest *> *)monitoredRequestsFlushAll;

/**
 *  Remove a request monitor
 *
 *  @param reqId The identifier that was returned when adding the monitor request
 *
 *  @return `YES` on success If `NO` one of the specified identifier was not associated to an active monitor request or request failed
 */
- (BOOL)monitorRequestRemoveWithId:(nonnull NSString *)reqId;

/**
 *  Remove a list of request monitors
 *
 *  @param reqIds The identifiers that were returned when adding the monitor requests
 *
 *  @return `YES` on success If `NO` one of the specified identifier were not associated to an active monitor request or request failed
 */
- (BOOL)monitorRequestRemoveWithIds:(nonnull NSArray<NSString *> *)reqIds;

/**
 *  Remove all active request monitors
 *
 *  @return `YES` on success
 */
- (BOOL)monitorRequestRemoveAll;

#pragma mark - Asynchronously Wait for Requests Commands

/**
 *  Asynchronously wait for a request to happen once on the app target. The rule is checked against the URL.absoluteString of the request.
 *
 *  Note: you have to start a monitor request before calling this method
 *
 *  @param match The match object that contains the matching rules. The method will look if the specified rules match the existing monitored requests
 *  @param timeout How long to wait for the request to happen
 *  @param completionBlock will be invoked once the requests is matched or timed out
 */
- (void)waitForMonitoredRequestsMatching:(nonnull SBTRequestMatch *)match timeout:(NSTimeInterval)timeout completionBlock:(nonnull void (^)(BOOL timeout))completionBlock;

/**
 *  Asynchronously wait for a request to happen a certain number of times on the app target. The rule is checked against the URL.absoluteString of the request.
 *
 *  Note: you have to start a monitor request before calling this method
 *
 *  @param match The match object that contains the matching rules. The method will look if the specified rules match the existing monitored requests
 *  @param timeout How long to wait for the request to happen
 *  @param iterations How often the request should happen before timing out
 *  @param completionBlock will be invoked once the requests is matched or timed out
 */
- (void)waitForMonitoredRequestsMatching:(nonnull SBTRequestMatch *)match timeout:(NSTimeInterval)timeout iterations:(NSUInteger)iterations completionBlock:(nonnull void (^)(BOOL timeout))completionBlock;

#pragma mark - Synchronously Wait for Requests Commands

/**
 *  Synchronously wait for a request to happen once on the app target. The rule is checked against the URL.absoluteString of the request.
 *
 *  Note: you have to start a monitor request before calling this method
 *
 *  @param match The match object that contains the matching rules. The method will look if the specified rules match the existing monitored requests
 *  @param timeout How long to wait for the request to happen
 *
 *  @return `YES` on success, `NO` on timeout
 */
- (BOOL)waitForMonitoredRequestsMatching:(nonnull SBTRequestMatch *)match timeout:(NSTimeInterval)timeout;

/**
 *  Synchronously wait for a request to happen a certain number of times on the app target. The rule is checked against the URL.absoluteString of the request.
 *
 *  Note: you have to start a monitor request before calling this method
 *
 *  @param match The match object that contains the matching rules. The method will look if the specified rules match the existing monitored requests
 *  @param timeout How long to wait for the request to happen
 *  @param iterations How often the request should happen before timing out
 *
 *  @return `YES` on success, `NO` on timeout
 */
- (BOOL)waitForMonitoredRequestsMatching:(nonnull SBTRequestMatch *)match timeout:(NSTimeInterval)timeout iterations:(NSUInteger)iterations;

#pragma mark - Throttle Requests Commands

/**
 *  Start throttling requests matching a regular expression pattern. The rule is checked against the URL.absoluteString of the request.
 *
 *  The throttled events can be successively polled using the throttledRequestsFlushAll method.
 *
 *  @param match The match object that contains the matching rules
 *  @param responseTime If positive, the amount of time used to send the entire response. If negative, the rate in KB/s at which to send the response data. Use SBTUITunnelStubsDownloadSpeed* constants
 *
 *  @return If nil request failed. Otherwise an identifier associated to the newly created throttle request. Should be used when using -(BOOL)throttleRequestRemoveWithId:
 */
- (nullable NSString *)throttleRequestsMatching:(nonnull SBTRequestMatch *)match responseTime:(NSTimeInterval)responseTime;

/**
 *  Remove a request throttle
 *
 *  @param reqId The identifier that was returned when adding the throttle request
 *
 *  @return `YES` on success If `NO` one of the specified identifier was not associated to an active throttle request or request failed
 */
- (BOOL)throttleRequestRemoveWithId:(nonnull NSString *)reqId;

/**
 *  Remove a list of request throttles
 *
 *  @param reqIds The identifiers that were returned when adding the throttle requests
 *
 *  @return `YES` on success If `NO` one of the specified identifier were not associated to an active throttle request or request failed
 */
- (BOOL)throttleRequestRemoveWithIds:(nonnull NSArray<NSString *> *)reqIds;

/**
 *  Remove all active request throttles
 *
 *  @return `YES` on success
 */
- (BOOL)throttleRequestRemoveAll;

#pragma mark - NSUserDefaults Commands

/**
 *  Add object to NSUSerDefaults.
 *
 *  @param object Object to be added
 *  @param key Key associated to object
 *
 *  @return `YES` on success
 */
- (BOOL)userDefaultsSetObject:(nonnull id<NSCoding>)object forKey:(nonnull NSString *)key;

/**
 *  Remove object from NSUSerDefaults.
 *
 *  @param key Key associated to object
 *
 *  @return `YES` on success
 */
- (BOOL)userDefaultsRemoveObjectForKey:(nonnull NSString *)key;

/**
 *  Get object from NSUserDefaults
 *
 *  @param key Key associated to object
 *
 *  @return The retrieved object.
 */
- (nullable id)userDefaultsObjectForKey:(nonnull NSString *)key;

/**
 *  Reset NSUserDefaults
 *
 *  @return `YES` on success
 */
- (BOOL)userDefaultsReset;

#pragma mark - NSBundle

- (nullable NSDictionary<NSString *, id> *)mainBundleInfoDictionary;

#pragma mark - Copy Commands

/**
 
 *  Upload item to remote host
 *
 *  @param srcPath source path
 *  @param destPath destination path relative to baseFolder
 *  @param baseFolder base folder for destPath
 *
 *  @return `YES` on success
 */
- (BOOL)uploadItemAtPath:(nonnull NSString *)srcPath toPath:(nullable NSString *)destPath relativeTo:(NSSearchPathDirectory)baseFolder;

/**
 *  Download one or more files from remote host
 *
 *  @param path source path (may include wildcard *, i.e ('*.jpg')
 *  @param baseFolder base folder for destPath
 *
 *  @return The data associated to the requested item
 */
- (nullable NSArray<NSData *> *)downloadItemsFromPath:(nonnull NSString *)path relativeTo:(NSSearchPathDirectory)baseFolder;

#pragma mark - Custom Commands

/**
 *  Perform custom command.
 *
 *  @param commandName custom name that will match [SBTUITestTunnelServer registerCustomCommandNamed:block:]
 *  @param object optional data to be attached to request
 *
 *  @return object returned from custom block
 */
- (nullable id)performCustomCommandNamed:(nonnull NSString *)commandName object:(nullable id)object;

#pragma mark - Other Commands

/**
 *  Set user iterface animations through [UIView setAnimationsEnabled:]. Should imporve test execution speed When enabled
 *  Sometimes useful as per https://forums.developer.apple.com/thread/6503
 *
 *  @param enabled enable animations
 *
 *  @return `YES` on success
 */
- (BOOL)setUserInterfaceAnimationsEnabled:(BOOL)enabled;

/**
 *  Set user iterface animations through UIApplication.sharedApplication.keyWindow.layer.speed. Should imporve test execution speed When enabled
 *
 *  @param speed speed of animation animations
 *
 *  @return `YES` on success
 */
- (BOOL)setUserInterfaceAnimationSpeed:(NSInteger)speed;

@end

#endif
