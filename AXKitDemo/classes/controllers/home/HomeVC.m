//
//  HomeVC.m
//  AXKit
//
//  Created by xaoxuu on 29/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "HomeVC.h"
#import "TestVC1.h"
@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view ax_eachSubview:nil action:^(__kindof UIView * _Nonnull subview) {
        [subview ax_fillWithRandomColor];
        [subview ax_addTapGestureHandler:^(UITapGestureRecognizer * _Nonnull sender) {
//            [self.navigationController ax_pushViewControllerNamed:@"TestVC1"];
            TestVC1 *vc = [TestVC1 new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
