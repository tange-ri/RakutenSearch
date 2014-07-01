//
//  PBResultsViewController.m
//  paboo_4
//
//  Created by Eri Tange on 2014/05/25.
//  Copyright (c) 2014年 Eri Tange. All rights reserved.
//

#import "PBResultsViewController.h"
#import "PBRakutenBookAPIWrapper.h"
#import "PBSearchingProducts.h"
#import "PBProduct.h"
#import "PBLookingResults.h"
#import "PBProductDetailViewController.h"
#import "PBLookingDetailOfProduct.h"

@interface PBResultsViewController ()
@property (nonatomic) IBOutlet UIBarButtonItem *back;
@property (nonatomic) NSInteger times;
@end

@implementation PBResultsViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"ToProductDetailSegue"]) {
        
        //クリックした所のセクションと行の情報が格納
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //選択したセルの詳細URLがわかるように
        PBLookingDetailOfProduct *lookingDetailContext = [self.context lookDetailWithIndex:indexPath.row];
        PBProductDetailViewController *destination = segue.destinationViewController;
        destination.context = lookingDetailContext;
    }
}

-(void)performToolbarButtonAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)performBackButtonAction:(id)sender{
    
    [self performToolbarButtonAction:_back];
}


- (void)scrollViewDidScroll:(UIScrollView *)scroll
{
    
    // 現在表示されているセルのindexPathを取得
    NSArray *indexPaths = [self.tableView indexPathsForVisibleRows];
    int row = ((NSIndexPath *)(indexPaths.lastObject)).row;
    
    
    if (!self.context.isLastPage && row >= self.context.count-10) {
        
        //処理中かどうかを判定するにはどうすれば…
        [self.context loadNextPage];
        //テーブルビューを読み込み直す
        [self.tableView reloadData];
    }
}


//それぞれのセルをつくるー
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifer = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    }
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *priceLabel = (UILabel *)[cell viewWithTag:2];
    UIImageView *img =(UIImageView *)[cell viewWithTag:3];
    
    //そのindexのproductをつくる
    PBProduct *product = [self.context productAtINdex:indexPath.row];
    titleLabel.text = product.title;
    priceLabel.text = [NSString stringWithFormat:@"%@",product.price];
    
    //画像を表示
    NSData * myData = [NSData dataWithContentsOfURL:[NSURL URLWithString:product.imgURL]];
    UIImage *bookImage = [UIImage imageWithData:myData];
    img.image = bookImage;
    
    //つるん、ってやるやつ
    indexPath = [tableView indexPathForRowAtPoint:CGPointMake(0, tableView.contentOffset.y + 1)];
    if (indexPath) {
        indexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


//-(IBAction)performBackButtonAction:(id)sender{
//    
//    [self performToolbarButtonAction:_back];
//}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    //contextのcountメソッドを呼び出している
    //カプセラレーション
    return self.context.count;
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
