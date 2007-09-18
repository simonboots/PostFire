//
//  Cluster.h
//  PostFire
//
//  Created by Simon Stiefel on 9/18/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Cluster : NSManagedObject {

}

- (void)fireUp;
- (void)shutDown;

- (BOOL)status;

@end
