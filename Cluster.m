//
//  Cluster.m
//  PostFire
//
//  Created by Simon Stiefel on 9/18/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import "Cluster.h"


@implementation Cluster

- (void)fireUp
{
    [self willChangeValueForKey:@"status"];

    NSString *pathToBin = @"/Users/sst/postgresql/bin/pg_ctl";
    
    NSTask *statusTask = [[NSTask alloc] init];
    NSMutableArray *args = [[NSMutableArray alloc] init];
    
    [args addObject:@"start"];
    [args addObject:@"-D"];
    [args addObject:[self valueForKey:@"location"]];
    
    [statusTask setLaunchPath:pathToBin];
    [statusTask setArguments:args];
    
    [statusTask launch];
    [statusTask waitUntilExit];
    [self didChangeValueForKey:@"status"];
}

- (void)shutDown
{
    [self willChangeValueForKey:@"status"];
    NSString *pathToBin = @"/Users/sst/postgresql/bin/pg_ctl";
    
    NSTask *statusTask = [[NSTask alloc] init];
    NSMutableArray *args = [[NSMutableArray alloc] init];
    
    [args addObject:@"stop"];
    [args addObject:@"-D"];
    [args addObject:[self valueForKey:@"location"]];
    
    [statusTask setLaunchPath:pathToBin];
    [statusTask setArguments:args];
    
    [statusTask launch];
    [statusTask waitUntilExit];
    [self didChangeValueForKey:@"status"];
}

- (BOOL)status
{
    [self willChangeValueForKey:@"statusImage"];

    NSString *pathToBin = @"/Users/sst/postgresql/bin/pg_ctl";
    
    NSTask *statusTask = [[NSTask alloc] init];
    NSMutableArray *args = [[NSMutableArray alloc] init];
    
    [args addObject:@"status"];
    [args addObject:@"-D"];
    [args addObject:[self valueForKey:@"location"]];
    
    [statusTask setLaunchPath:pathToBin];
    [statusTask setArguments:args];
    
    [statusTask launch];
    [statusTask waitUntilExit];
    
    [self didChangeValueForKey:@"statusImage"];

    return [statusTask terminationStatus] == 1 ? NO : YES;
}

- (NSImage *)statusImage
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSImage *statusImage;
    if ([self status]) {
        statusImage = [[NSImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"traffic_light_green" ofType:@"png"]];
    } else {
        statusImage = [[NSImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"traffic_light_red" ofType:@"png"]];
    }
    
    [statusImage autorelease];
    return statusImage;
}

@end
