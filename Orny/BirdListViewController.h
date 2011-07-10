//
//  BirdListViewController.h
//  Orny
//
//  Created by 3Easy on 23/05/11.
//  Copyright 2011 3Easy Web Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BirdListDetailViewController.h"
#import "OrnyAppDelegate.h"

@interface BirdListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
}

- (void)loadBirdData;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, retain) NSArray *birds;

@end
