//
//  MADNJFirstViewController.h
//  madNJStoryboardApp
//
//  Created by Ainsley Rattray on 1/8/12.
//  Copyright (c) 2012 Kaliware, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "PlayerDetailsViewController.h"

@interface MADNJFirstViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;
           
@end
