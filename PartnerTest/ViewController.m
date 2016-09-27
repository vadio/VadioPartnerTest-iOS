//
//  ViewController.m
//  PartnerTest
//
//  Created by Raphael on 9/23/16.
//  Copyright © 2016 Vadio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) id<VADPlayer>vadio;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    VADPlayerOptions *vadioPlayerOptions = [VADPlayerOptions defaultOptions];
    vadioPlayerOptions.externalViewMode = VADExternalViewModeFullscreen;
    vadioPlayerOptions.playlistViewType = VADPlaylistViewTypeVertical;
    vadioPlayerOptions.autoPlay = YES;
    //The handle must be unique for each player instance in your app.
    vadioPlayerOptions.handle = @"fd7705921e00ed7cde75ffa1450b91ab";
    
    VADMediaSelector *selector = nil;
    self.vadio = CreateVadioPlayer(vadioPlayerOptions, selector, self);
    
    if (self.vadio == nil) {
        return;
    }
    
    /**
     * Before the videos are actually playing, you can still do whatever you want with the view, and once the player is finished setting
     * itself up it will load into wherever you put it.
     */
    UIView *view = self.view;
    [view addSubview:self.vadio.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playerReady {
    VADUnresolvedDescriptor *desc = [[VADUnresolvedDescriptor alloc] initWithArtist:@"Ariana Grande" title:@"Side to Side"];
    [self.vadio queueNewItems:@[desc]];
}

- (void)newPlaylistItem:(VADMediaDescriptor *)item availableForHandle:(NSString *)handle {
    
}

- (void)playerError:(NSError*)error critical:(BOOL)critical {
    NSLog(@"%@", [error.userInfo objectForKey:@"message"]);
}

- (void)playerWarning:(NSString *)warning {
    NSLog(@"%@", warning);
}
@end
