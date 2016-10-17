//
//  ViewController.m
//  (1014)3TableViewCustomView
//
//  Created by Nexus_MYT on 2016. 10. 14..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"
#import "IdolCustomCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property UITableView *tv;
@property NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataList = @[@{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"},
                      @{@"title":@"트와이스1 이다", @"image":@"twice1.jpg"},
                      @{@"title":@"트와이스2", @"image":@"twice2.jpg"}
                      ];
    
    self.tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tv.delegate = self;
    self.tv.dataSource = self;
    [self.view addSubview:self.tv];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0)
        return 260;
    else
        return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    IdolCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[IdolCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *data = self.dataList[indexPath.row];
    
    [cell setBackgroundImageName:[data objectForKey:@"image"]];
    [cell setTitle:[data objectForKey:@"title"]];
//    NSLog(@"%@ %@", [data objectForKey:@"image"], [data objectForKey:@"title"]);
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
