//
//  AppDelegate.m
//  PartnerTest
//
//  Created by Raphael on 9/23/16.
//  Copyright © 2016 Vadio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *path = [[NSBundle mainBundle] pathForResource: @"credentials" ofType: @"plist"];
    NSMutableDictionary *dictplist =[[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    VADSDKOptions *options = [VADSDKOptions defaultOptions];
    options.apiKey = [dictplist objectForKey:@"vadio_api_key"];
    options.appName = @"demoApp";
    
    PrefetchVadioSettings(@[@"fd7705921e00ed7cde75ffa1450b91ab"]);
    InitializeVadio(options, self);
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


# pragma mark - VADSDKDelegate Methods -
- (void)vadioError:(NSError *)error critical:(BOOL)critical {
    NSLog(@"%@", [error.userInfo objectForKey:@"message"]);
}

- (void)networkSpeedWarning {

}


@end
