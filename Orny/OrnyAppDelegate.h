//
//  OrnyAppDelegate.h
//  Orny
//
//  Created by 3Easy on 23/05/11.
//  Copyright 2011 3Easy Web Org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrnyAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
