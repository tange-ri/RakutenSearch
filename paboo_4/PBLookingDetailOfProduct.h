//
//  PBLookingDetailOfProduct.h
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBProduct.h"

@interface PBLookingDetailOfProduct : NSObject

//readonlyにできるものはreadonlyにする
@property (readonly) PBProduct *product;

//必然性がない限りは作らない
//+(PBLookingDetailOfProduct *)sharedPBLookingDetailOfProduct;

-(instancetype)initWithProduct:(PBProduct *)product;

@end
