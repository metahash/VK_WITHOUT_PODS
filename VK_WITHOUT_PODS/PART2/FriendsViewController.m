//
//  FriendsViewController.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "FriendsViewController.h"
#import "DetailViewController.h"
#import "NetManager.h"
#import "FriendsTableViewCell.h"
#import "FriendsModel.h"

@interface FriendsViewController ()
@property(nonatomic, strong) NSArray *dictArray;
@end

@implementation FriendsViewController

static NSInteger cellCount = 0;
static NSString * loadingCellIndifier = @"loadingCellIndifier";
static NSString* cellID = @"friendsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNib];
}

- (void) registerNib {
    [self.tableView registerNib:[UINib nibWithNibName:@"LoadingTableViewCell" bundle:nil] forCellReuseIdentifier:loadingCellIndifier];
    
    [self.tableView registerNib:[UINib
                                 nibWithNibName:@"FriendsTableViewCell" bundle:nil]
         forCellReuseIdentifier:cellID];
}

- (void)getFriendsDate {
    self.isLoading = YES;
    FriendsModel * friendsModel = [FriendsModel new];
    NSString *friendsRequest = [friendsModel getFriendsURL:(int)cellCount];
    
    [[NetManager sharedInstance] loadRequestWithPath: friendsRequest completion:^(id data, NSError *error) {
        if (data) {
            id responseData = [data valueForKey:@"response"];
            self.dictArray = [responseData valueForKey:@"items"];
            [self.tableView reloadData];
        }
    }];
}

- (void)updateCell {
    cellCount += 10;
    [self getFriendsDate];
}



#pragma mark - TableViewDelegate

//updates botton scroll
- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (cellCount - self.dictArray.count >= 30 ) {
        NSLog(@"STOP - all data uploaded");
        cellCount = self.dictArray.count + 20;
        self.isLoading = YES;
    }
    
    if (indexPath.section == 1 && !self.isLoading) {
        [self updateCell];
        self.isLoading = NO;
        NSLog(@"bottom scroll.....%lu cell",(unsigned long)self.dictArray.count);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 1 ? !self.isLoading : self.dictArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        return [tableView dequeueReusableCellWithIdentifier: loadingCellIndifier];
    }
    
    FriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.model = self.dictArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90 ;
}


#pragma mark - Navigation
- (IBAction)returnToListVC:(UIStoryboardSegue* )sender {}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row  == [self.dictArray count]) {
        [self getFriendsDate];
    }
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        DetailViewController *vc;
        vc = [segue destinationViewController];
        vc.data = [self.dictArray objectAtIndex:path.row];
    }
}

@end

