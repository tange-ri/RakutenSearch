//
//  PBLookingResultsFactory.h
//  paboo_4
//
//  Created by Eri Tange on 2014/06/02.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBLookingResults.h"

@protocol PBLookingResultsFactory <NSObject>
-(PBLookingResults *)createWithSearchedWord:(NSString *)searchedWord;
@end
