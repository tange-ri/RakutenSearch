//
//  PBProductSearchAPIWrapper.h
//  paboo_4
//
//  Created by Eri Tange on 2014/05/26.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBProductSearchAPIWrapper <NSObject>

- (NSArray *)searchWithWord:(NSString *)word currentCount:(NSInteger)currentCount;

@end
