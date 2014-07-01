//
//  PBProduct.h
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBProduct : NSObject
//1エンティティ分の商品情報量を入れる
@property (nonatomic) NSString *title;
@property (nonatomic) NSNumber *price;
@property (nonatomic) NSString *imgURL;
@property (nonatomic) NSString *detailURL;

@end
