//
//  PBRakutenBookAPIWrapper.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBRakutenBookAPIWrapper.h"
#import "PBProduct.h"
#import "PBProductSearchAPIWrapper.h"

@interface PBRakutenBookAPIWrapper ()
@end

@implementation PBRakutenBookAPIWrapper

//商品情報は配列の形で欲しいので、配列で返すようにする
-(NSArray *)searchWithWord:(NSString *)word currentCount:(NSInteger)currentCount{
    
    NSInteger rakutenOnceReturnCount = 30;
    
    //楽天APIを使う
    NSString *url = [NSString stringWithFormat:@"https://app.rakuten.co.jp/services/api/BooksTotal/Search/20130522?format=json&keyword=%@&booksGenreId=000&page=%ld&applicationId=1005493408677495287",word,(long)currentCount/rakutenOnceReturnCount + 1];
    
    // パーセントエンコード
    NSString *urlEscapeStr = [[NSString  stringWithString:url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",urlEscapeStr);
    // 通信するためにNSMutableURLRequest型のrequestを作成
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlEscapeStr] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    // 通信
    // Check whether the data is returned. If failed, print out the err
    NSURLResponse *response = nil;
    NSError *err = nil;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    if (returnData == nil) {
        NSLog(@"ERROR: %@", err);
    } else {
        NSLog(@"DATA: %@", returnData);
    }

    //jsonをPBProduct[0],[1],[3]のような配列に変えていく
    
    //楽天APIは一番上の階層がDictionaryなので、いちどNSDictionaryにしまう
    NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    //エラーのときこの先を読ませない
    if (jsonResults[@"error"] != nil) {
        
        //配列リテラルのなかになにも書かない＝配列が空
        return @[];
    }
    
    //結果を返すための配列を用意
    NSMutableArray *results = [NSMutableArray new];     
    //n番目のNSDictionaryをProductにしまう
    for (NSDictionary *itemParent in jsonResults[@"Items"]) {
        
        NSDictionary *item = itemParent[@"Item"];
        PBProduct *product = [PBProduct new];
        product.title = item[@"title"];
        product.price = item[@"itemPrice"];
        product.imgURL = item[@"largeImageUrl"];
        product.detailURL = item[@"itemUrl"];
        
        //productを配列に入れる
        [results addObject:product];
    }
    
    //商品の配列を返す
    return results;
    
    //ここではproductの配列しか作ってない
    //lastを返すにはどうすればいいの…？
}

@end
