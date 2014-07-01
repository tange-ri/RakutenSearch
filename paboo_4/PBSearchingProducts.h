//
//  PBSearchingProducts.h
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBLookingResults.h"
#import "PBProductSearchAPIWrapper.h"
#import "PBLookingResultsFactory.h"

@interface PBSearchingProducts : NSObject

- (PBLookingResults *)searchRakuten:(NSString *)searchedWord;
- (instancetype)initWithLookingResultsFactory:(id<PBLookingResultsFactory>)lookingResultsFactory;
@end
