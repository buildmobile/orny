//
//  BirdListDetailViewController.h
//  Orny
//
//  Created by Andy White on 5/06/11.
//  Copyright 2011 Sitepoint. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BirdListDetailViewController : UIViewController {
    IBOutlet UIImageView *imageView;
    NSString *filename;
}

@property (nonatomic, assign) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) NSString *filename;

@end
