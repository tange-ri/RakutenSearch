//
//  PBLookingResultsFactory.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/27.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBProductionLookingResultsFactory.h"
#import "PBLookingResults.h"
#import "PBRakutenBookAPIWrapper.h"

@implementation PBProductionLookingResultsFactory

-(PBLookingResults *)createWithSearchedWord:(NSString *)searchedWord{
    
    //PBRakutenBookAPIWrapperを生成
    
    PBRakutenBookAPIWrapper * wrapper = [PBRakutenBookAPIWrapper new];
    //楽天結果の検索
    //依存性の注入
    //APIWrapperを生成&そこにresultsをいれこんでcontexへ
    PBLookingResults *context = [[PBLookingResults alloc] initWithAPIWrapper:wrapper searchedWord:searchedWord];
    
    return context;
}



@end
