//
//  ViewController.m
//  (1013)TableViewExample
//
//  Created by Nexus_MYT on 2016. 10. 13..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 1. 프로토콜을 상속받는다
<UITableViewDelegate, UITableViewDataSource>

// 13. 데이터 만들 프로퍼티 선언
@property NSArray *carName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 14. 차종을 array 에 저장
    self.carName = @[@"티코",@"람보르기니",@"미니쿠페",@"맥나렌",@"레토나",@"포니",@"부가티",@"벨로스터",@"시발차",@"두돈반"];
    
    // 2. 테이블 객체 생성
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    // 3. 델리게이트 선언
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    
}

// 4. datasource 생성 -> 한 번에 보여주는 row 의 갯수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 5. row 10개 생성
//    return 1000;
    
    // 15. 자동차 갯수만큼 셀 생성
    return self.carName.count;
}

// 6. cell 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 7. cell text 에 index path row 를 넣는다
    // UITableViewCell *cell = [[UITableViewCell alloc] init];
    // cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];

    // 8. 메서드의 움직임을 확인해보자
    // NSLog(@"%@", cell.textLabel.text);
    
    
    // 9. 생성된 셀을 재사용하기 위해서 다음과 같이 메소드를 변경선언 -> 큐에서 재사용 가능한 셀을 계속 빼라는 선언
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        // 10. 셀은 화면에 보이는 만큼만 호출될 것이다
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
//        NSLog(@"%ld", indexPath.row);
//    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
//    

    // 16. 자동차 리스트 출력
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        NSLog(@"%ld", indexPath.row);
    }
    cell.textLabel.text = self.carName[indexPath.row];
    
    
    return cell;
}

// 11. cell height 변경하는 메서드
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 12. height 를 각 cell 마다 60 포인트로 설정
    return 60;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
