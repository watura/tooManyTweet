//
//  ViewController.m
//  TooManyTweet
//
//  Created by Wataru Nishimoto on 11/12/16.
//  Copyright (c) 2011年 none. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initEasyTweet];
    flg = [NSNumber numberWithInt:0];

}

- (void)initEasyTweet {
    // Set up the built-in twitter composition view controller.
    tweetViewController = [[TWTweetComposeViewController alloc] init];
    __weak ViewController *weakSelf = self;

    // Set the initial tweet text. See the framework for additional properties that can be set.    
    // Create the completion handler block.    
    [tweetViewController setCompletionHandler:^(TWTweetComposeViewControllerResult result) {
        NSNumber*  tmp;
        switch (result) {
            case TWTweetComposeViewControllerResultCancelled:
                // The cancel button was tapped.
                tmp = [NSNumber numberWithInt:0];
                break;
            case TWTweetComposeViewControllerResultDone:
                tmp = [NSNumber numberWithInt:1];
                // The tweet was sent.
                break;
            default:
                tmp = [NSNumber numberWithInt:0];
                break;
        }
        
        
        // Dismis   s the tweet composition view controller.
        [weakSelf dismissModalViewControllerAnimated:YES];
        [weakSelf performSelectorOnMainThread:@selector(next:) withObject:tmp waitUntilDone:NO];
    }];
    
    // Present the tweet composition view controller modally.
}

-(void)next:(NSNumber*)tmp{
}

-(IBAction)sendManyTweet:(id)sender{
    [tweetViewController setInitialText:[NSString stringWithFormat:@"%@ ",[footer text]]];
    [self presentModalViewController:tweetViewController animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [footer becomeFirstResponder];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
