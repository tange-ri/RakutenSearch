//
//  PBLookingDetailOfProduct.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBLookingDetailOfProduct.h"

@implementation PBLookingDetailOfProduct

//@synthesize product = _product;

-(instancetype)initWithProduct:(PBProduct *)product{
    
    if (self = [super init]) {
        _product = product;
    }
    return self;
}

@end
