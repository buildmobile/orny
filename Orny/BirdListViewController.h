//
//  BirdListViewController.h
//  Orny
//
//  Created by 3Easy on 23/05/11.
//  Copyright 2011 3Easy Web Org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BirdListViewController : UIViewController <UITableViewDataSource> {
    
}

- (void)loadBirdData;

@property (nonatomic, retain) NSMutableArray *birds;

@end
