//
//  ViewController.m
//  (1013)TableViewmovie
//
//  Created by Nexus_MYT on 2016. 10. 13..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property NSArray *movieName;
@property NSArray *imageList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieName = @[@{@"genre":@"horror",
                         @"item":@[@"scream", @"the house of Dead", @"Ring"]},
                       @{@"genre":@"thriller",
                         @"item":@[@"SAW", @"Indepandance Day", @"Die hard"]},
                       @{@"genre":@"BlockBuster",
                         @"item":@[@"Lord of Rings", @"Jerusalem", @"Enamy At the gate",@"Lord of Rings2", @"Jerusalem", @"Enamy At the gate"]},
                       @{@"genre":@"Family",
                         @"item":@[@"three idiots", @"dum and dummer", @"Mask"]},
                       @{@"genre":@"Family2",
                         @"item":@[@"2three idiots", @"2dum and dummer", @"2Mask"]}];
    
    self.imageList = @[@"bear.jpg",@"black_swan.jpg",@"buffalo.jpg",@"camel.jpg",@"cockatoo.jpg",@"dog.jpg",@"donkey.jpg",@"duck.jpg"];
    
    UITableView *movieList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    movieList.delegate = self;
    movieList.dataSource = self;
    [self.view addSubview:movieList];
}

// 섹션(genre) 갯수 결정하는 메서드
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.movieName.count;
}

// 섹션당 row(item) 수를 결정하는 메서드
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movieName[section][@"item"] count];
}

// cell 생성하는 메서드
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.movieName[indexPath.section][@"item"][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.imageList[indexPath.row]];

    // 파일을 인터넷에서 다운받아서 리스트에 뿌리기 -> 근데 너무 오래 걸려서 요즘은 비동기 방식을 쓴다(https 만 된다)
//    NSURL *url = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/5/54/Twice_performing_at_SAC_2016_02_(cropped).jpg"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    cell.imageView.image = [UIImage imageWithData:data];
    
    return cell;
}

// cell 의 title 생성하는 메서드
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *movieData = self.movieName[section];
    NSString *title = movieData[@"genre"];
    return title;
}

// row 가 선택되었을 때 동작하는 콜백 메서드
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"선택" message:@"선택 확인" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okBtn];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
