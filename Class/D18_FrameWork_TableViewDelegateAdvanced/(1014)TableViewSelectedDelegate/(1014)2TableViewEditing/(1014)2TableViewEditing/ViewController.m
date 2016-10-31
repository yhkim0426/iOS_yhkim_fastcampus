//
//  ViewController.m
//  (1014)2TableViewEditing
//
//  Created by Nexus_MYT on 2016. 10. 14..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property UITableView *tableView;
@property NSMutableArray *animals;
@property BOOL isEditing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *data = @[@{@"index":@"b",
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
    
    self.animals = [[NSMutableArray alloc] initWithArray:data];
    
    // 1. edit 할 수 있는 버튼 생성
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onClickEditButton:)];
    [self.navigationItem setLeftBarButtonItem:editButton];
    
    // 2. 테이블 뷰를 전역변수로 선언해서 그것에게 테이블뷰 할당
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

// 3. 테이블 뷰를 에디트 모드로 바꾸는 역할을 하는 메서드
- (void)onClickEditButton:(UIBarButtonItem *)item {
    
    if (!self.isEditing) {
        [self.tableView setEditing:YES animated:YES];
        self.isEditing = YES;
    } else {
        [self.tableView setEditing:NO animated:YES];
        self.isEditing = NO;
    }
    
    // tableView dataSource canEditing 여부 확인
    // tableView delegate edittingStyle
    // commitEditting
}

// 인덱스(b - e) 갯수 결정하는 메서드
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.animals.count;
}

// 섹션당 row(item) 수를 결정하는 메서드
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.animals[section][@"item"] count];
}

// cell 의 header title 생성하는 메서드
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *animalNameIndex = self.animals[section];
    NSString *title = animalNameIndex[@"index"];
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
    
    cell.textLabel.text = self.animals[indexPath.section][@"item"][indexPath.row][@"name"];
    
    return cell;
}

// switch 를 바꿨을 때 시행되는 메서드
- (void)valueChangedRolex:(UISwitch *)sender {
    
}

// 4. editting 을 위한 함수들
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 5. editting 으로 삭제를 선택함
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 6. commit 하기 위한 메서드
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 데이터 지우고
//    [self.animals removeObjectAtIndex:self.animals[indexPath.section][@"item"][indexPath.row]];
    // 셀 지우기
    
}

// 7. cell 을 움직일 수 있게 함
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 8. 특정 index 로 셀을 이동함
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    // If row is deleted, remove it from the list.

    // 데이터 변경
//    NSString *stringToMove = [self.animals objectAtIndex:sourceIndexPath.row];
    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
//        [controller removeObjectFromListAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
