//
//  ViewController.h
//  TooManyTweet
//
//  Created by Wataru Nishimoto on 11/12/16.
//  Copyright (c) 2011年 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController{
    TWTweetComposeViewController *tweetViewController;
    NSNumber* flg;
    IBOutlet UITextField *footer;
}


- (void)initEasyTweet;

-(IBAction)sendManyTweet:(id)sender;
@end
