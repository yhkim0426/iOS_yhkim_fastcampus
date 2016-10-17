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

@property NSArray *animals;
@property NSMutableArray *isOnSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animals = @[@{@"index":@"b",
                       @"item":@[@{@"name":@"bear", @"imageName":@"bear.jpg"},
                            @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                             @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"}]},
                     @{@"index":@"c",
                       @"item":@[@{@"name":@"camel", @"imageName":@"camel.jpg"},
                             @{@"name":@"cockatoo", @"imageName":@"cockatoo.jpg"}]},
                     @{@"index":@"d",
                       @"item":@[@{@"name":@"dog", @"imageName":@"dog.jpg"},
                            @{@"name":@"donkey", @"imageName":@"donkey.jpg"},
                            @{@"name":@"duck", @"imageName":@"duck.jpg"}]},
                     @{@"index":@"e",
                       @"item":@[@{@"name":@"elephant", @"imageName":@"elephant.jpg"},
                            @{@"name":@"emu", @"imageName":@"emu.jpg"},
                            @{@"name":@"elephant", @"imageName":@"elephant.jpg"},
                            @{@"name":@"emu", @"imageName":@"emu.jpg"}]},
                     
                     @{@"index":@"f",
                       @"item":@[@{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"},
                                 @{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"}]},
                     @{@"index":@"g",
                       @"item":@[@{@"name":@"camel", @"imageName":@"camel.jpg"},
                                 @{@"name":@"cockatoo", @"imageName":@"cockatoo.jpg"},
                                 @{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"},
                                 @{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"}]},
                     @{@"index":@"h",
                       @"item":@[@{@"name":@"dog", @"imageName":@"dog.jpg"},
                                 @{@"name":@"donkey", @"imageName":@"donkey.jpg"},
                                 @{@"name":@"duck", @"imageName":@"duck.jpg"},
                                 @{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"},
                                 @{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"}]},
                     @{@"index":@"i",
                       @"item":@[@{@"name":@"elephant", @"imageName":@"elephant.jpg"},
                                 @{@"name":@"emu", @"imageName":@"emu.jpg"},
                                 @{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"},
                                 @{@"name":@"bear", @"imageName":@"bear.jpg"},
                                 @{@"name":@"black_swan", @"imageName":@"black_swan.jpg"},
                                 @{@"name":@"buffalo", @"imageName":@"buffalo.jpg"}]}];

    self.isOnSwitch = [[NSMutableArray alloc] initWithCapacity:self.animals.count];
    
    UITableView *animals = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    animals.delegate = self;
    animals.dataSource = self;
    [self.view addSubview:animals];
}

// 인덱스(b - e) 갯수 결정하는 메서드
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.animals.count;
}

// 섹션당 row(item) 수를 결정하는 메서드
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.animals[section][@"item"] count];
}

// cell 생성하는 메서드
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    
//    cell.textLabel.text = self.animals[indexPath.section][@"item"][indexPath.row][@"name"];
//    cell.imageView.image = [UIImage imageNamed:
//                            self.animals[indexPath.section][@"item"][indexPath.row][@"imageName"]];
//
//    UISwitch *testSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    cell.accessoryView = testSwitch;
//    
//    if (indexPath.section == indexPath.row) {
//        testSwitch.on = YES;
//    }
//    
//    return cell;
    
    UITableViewCell *cell;
    
    if (indexPath.row == indexPath.section) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"switchCell"];
        UISwitch *rolex;
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"switchCell"];
            rolex = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 1000, 1000)];
            [rolex addTarget:self action:@selector(valueChangedRolex:) forControlEvents:UIControlEventValueChanged];
            rolex.tag = indexPath.row;
            cell.accessoryView = rolex;
        }
        
//        BOOL isOn = self.animals;
//        if (isOn) {
//            [rolex setOn:isOn];
//        }
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
    }
    
//    cell.textLabel.text = [NSString stringWithFormat:@"row %ld",indexPath.row];
    cell.textLabel.text = self.animals[indexPath.section][@"item"][indexPath.row][@"name"];
    
    return cell;
}

- (void)valueChangedRolex:(UISwitch *)sender {
    
}

// cell 의 header title 생성하는 메서드
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *animalNameIndex = self.animals[section];
    NSString *title = animalNameIndex[@"index"];
    return title;
}

// cell 의 footer title 생성하는 메서드
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    NSDictionary *animalNameIndex = self.animals[section];
//    NSString *title = animalNameIndex[@"index"];
//    return title;
//}

// row 가 선택되었을 때 alert 을 시행하는 콜백 메서드
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *cellName = self.animals[indexPath.section][@"item"][indexPath.row][@"name"];
    NSString *titleName = self.animals[indexPath.section][@"index"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:cellName message:[NSString stringWithFormat:@"index: %@",titleName] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okBtn];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
