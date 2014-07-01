//
//  PBSearchingProducts.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBSearchingProducts.h"
#import "PBLookingResults.h"
#import "PBProductSearchAPIWrapper.h"
#import "PBProductionLookingResultsFactory.h"

@interface PBSearchingProducts ()
@property (nonatomic) id<PBLookingResultsFactory>lookingResulsFactory;
@end

@implementation PBSearchingProducts


- (instancetype)initWithLookingResultsFactory:(id<PBLookingResultsFactory>)lookingResultsFactory{
    
    if (self = [super init]) {
        
        self.lookingResulsFactory = lookingResultsFactory;
    }
    
    return self;
}

-(PBLookingResults *)searchRakuten:(NSString *)searchedWord {
    
    //LookingResultsContextに渡す(resultsとword)

    PBLookingResults *lookingresultsContext = [self.lookingResulsFactory createWithSearchedWord:searchedWord];
    
    return lookingresultsContext;
}

@end
    