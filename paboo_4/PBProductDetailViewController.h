//
//  PBProductDetailViewController.h
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBLookingDetailOfProduct.h"

@interface PBProductDetailViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic) PBLookingDetailOfProduct *context;
@end
