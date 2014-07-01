//
//  PBSearchingProductsFactory.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/26.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBSearchingProductsFactory.h"
#import "PBRakutenBookAPIWrapper.h"
#import "PBSearchingProducts.h"
#import "PBProductionLookingResultsFactory.h"

static PBSearchingProductsFactory *_sharedSearchingProductsFactory = nil;

@implementation PBSearchingProductsFactory

-(PBSearchingProducts *)createSearchingProducts{
    
    PBProductionLookingResultsFactory *productionLookingResultsFactory = [PBProductionLookingResultsFactory new];
    PBSearchingProducts *context = [[PBSearchingProducts alloc] initWithLookingResultsFactory:productionLookingResultsFactory];
    
    return context;
}

//結果はFactoryから得る
+(PBSearchingProductsFactory *)sharedSearchingProductsFactory {
 
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedSearchingProductsFactory = [PBSearchingProductsFactory new];
    });
    
    return _sharedSearchingProductsFactory;
}
                                         
                                         
@end
