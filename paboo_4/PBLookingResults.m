//
//  PBLookingResults.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBLookingResults.h"
#import "PBProduct.h"
#import "PBProductSearchAPIWrapper.h"
#import "PBRakutenBookAPIWrapper.h"
#import "PBProductionLookingResultsFactory.h"

static PBLookingResults *_sharedLookingResults = nil;

@interface PBLookingResults ()
@property (nonatomic) NSMutableArray *results;
@property (nonatomic) NSString *searchedWord;
@property (nonatomic) id<PBProductSearchAPIWrapper> apiWrapper;
@end

@implementation PBLookingResults


//読み込み

//nページ目を読むメソッド
-(void)loadNextPage{
    
    //API呼び出し
    NSArray *results = [self.apiWrapper searchWithWord:self.searchedWord currentCount:self.results.count];
    //☆self.results.count　resultの要素の数を数えている
    
    if (results.count == 0) {
        _isLastPage = YES;
    }else{
        [self.results addObjectsFromArray:results];
    }
}

-(PBLookingDetailOfProduct *)lookDetailWithIndex:(NSInteger)index{
    
    PBProduct *product = [self productAtINdex:index];
    PBLookingDetailOfProduct *lookingDetailContext = [[PBLookingDetailOfProduct alloc] initWithProduct:product];
    
    return lookingDetailContext;
}


+ (PBLookingResults *)sharedLookingResults{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedLookingResults = [PBLookingResults new];
    });
    
    return _sharedLookingResults;
}


- (instancetype)initWithAPIWrapper:(id<PBProductSearchAPIWrapper>)apiWrapper searchedWord:(NSString *)searchedWord{
    

//    PBLookingResults *oself = [super init];
//    if (oself != nil) {
//        oself.results = results.mutableCopy;
//    }
//    
//    return oself;

//    self = [super init];
//    if (self != nil) {
//        self.results = results.mutableCopy;
//    }
//    return self;

//    self = [super init];
//    if (self) {
//        self.results = results.mutableCopy;
//    }
//    return self;
    
    
    if (self = [super init]) {
        
        //プロパティで持っている配列を初期化
        //mutableCopy＝インスタンスの可変コピーを返す
        self.searchedWord= searchedWord;
        self.results = [NSMutableArray new];
        self.apiWrapper = apiWrapper;
        _isLastPage = NO;
        [self loadNextPage];
    
    }
  
    return self;
}

//resultsからindexのところのProductを出す
- (PBProduct *)productAtINdex:(NSInteger)index{
    
    return self.results[index];
}

#pragma mark propaties

//カプセラレーション（内部実装を見せない）
//あとで実装方法を変えた場合でもだいじょうぶ
-(NSInteger)count{
    
    return self.results.count;
}

@end
