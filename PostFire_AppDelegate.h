//
//  PostFire_AppDelegate.h
//  PostFire
//
//  Created by Simon Stiefel on 9/18/07.
//  Copyright __MyCompanyName__ 2007 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PostFire_AppDelegate : NSObject 
{
    IBOutlet NSWindow *window;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;

- (IBAction)saveAction:sender;

@end
