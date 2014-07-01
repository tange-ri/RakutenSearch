//
//  PBProductSearchViewController.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBProductSearchViewController.h"
#import "PBSearchingProducts.h"
#import "PBLookingResults.h"
#import "PBResultsViewController.h"
#import "PBSearchingProductsFactory.h"

@interface PBProductSearchViewController ()
@property (nonatomic) IBOutlet UITextField *inputField;
@property (nonatomic) IBOutlet UIButton *searchButton;
@end

@implementation PBProductSearchViewController

//セグウェを実行する際に検索を行う

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"ToProductResultsSegue"]) {
        
        //依存性が注入されたSearchingProducts
        PBSearchingProducts *context = [[PBSearchingProductsFactory sharedSearchingProductsFactory] createSearchingProducts];
        //SearchRakutenで返ってくるのはPBLookingResultsなので、それ用の箱を用意
        PBLookingResults *lookingResultsContext = [context searchRakuten:_inputField.text];
        
        //segue.destinationViewController飛び先のコントローラー
        PBResultsViewController *destination = segue.destinationViewController;
        //遷移先のPBLookingResults *contextに結果を入れる
        destination.context = lookingResultsContext;
        destination.searchedWord = _inputField.text;
        
    }
    
}

//returnが押されたときの処理
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //キーボードを閉じる
    [textField resignFirstResponder];
    
    return TRUE;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _inputField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
