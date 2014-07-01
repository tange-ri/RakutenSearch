//
//  PBLookingResults.h
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBProduct.h"
#import "PBLookingDetailOfProduct.h"
#import "PBProductSearchAPIWrapper.h"

@interface PBLookingResults : NSObject

@property (readonly) NSInteger count;
@property (readonly) BOOL isLastPage;

- (instancetype)initWithAPIWrapper:(id<PBProductSearchAPIWrapper>)apiWrapper searchedWord:(NSString *)searchedWord;
- (PBProduct *)productAtINdex:(NSInteger)index;
-(PBLookingDetailOfProduct *)lookDetailWithIndex:(NSInteger)index;
-(void)loadNextPage;

@end
