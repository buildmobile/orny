//
//  Species.h
//  Orny
//
//  Created by Andy White on 10/07/11.
//  Copyright (c) 2011 Sitepoint. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Species : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * text_description;
@property (nonatomic, retain) NSString * filename;

@end
