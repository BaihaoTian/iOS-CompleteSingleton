//
//  Singleton.m
//  CompleteSingleton-iOS
//
//  Created by Bc.whi1te_Lei on 2016/12/5.
//  Copyright © 2016年 Bc.whi1te_Lei. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
static Singleton *_sharedInstance = nil;

+ (instancetype)sharedInstance {
  
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    //because has rewrited allocWithZone  use NULL avoid endless loop .
    _sharedInstance = [[super allocWithZone:NULL] init];
  });
  
  return _sharedInstance;
}
#pragma mark - rewrite
+ (id)allocWithZone:(struct _NSZone *)zone
{
  return [Singleton sharedInstance];
}

+ (instancetype)alloc
{
  return [Singleton sharedInstance];
}

- (id)copy
{
  return self;
}

- (id)mutableCopy
{
  return self;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
  return self;
}


#pragma mark - MRC method 
//if you are using MRC this method should not be commented


/***
 
 //  because there have only one singleton  it can't be released
- (instancetype)retain
{
  return self;
}

- (oneway void)release
{
  // nothing
}

- (instancetype)autorelease
{
  return self;
}

- (NSUInteger)retainCount
{
  return NSUIntegerMax; // return max integer so that singleton wouldn't be released
}
 
 ***/

@end
