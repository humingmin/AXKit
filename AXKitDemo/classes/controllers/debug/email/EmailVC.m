//
//  EmailVC.m
//  AXKit
//
//  Created by xaoxuu on 12/05/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "EmailVC.h"
#import "UIViewController+AXMailWrapper.h"

@interface EmailVC ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *seg_subject;
@property (weak, nonatomic) IBOutlet UITextView *tv_content;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (strong, nonatomic) UIImage *img;

@property (weak, nonatomic) IBOutlet UITextField *tf_summary;

@end

@implementation EmailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initContentView:(UIView *)view style:(void (^)(ContentViewStyle))style{
    self.seg_subject.tintColor = axColor.theme.darkRatio(0.3);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ax_itemWithImageName:@"send" action:^(id  _Nonnull sender) {
        [self sendEmail:^(MFMailComposeViewController *mailCompose) {
            // 设置邮件主题
            NSString *title = [self.seg_subject titleForSegmentAtIndex:self.seg_subject.selectedSegmentIndex];
            [mailCompose setSubject:[NSString stringWithFormat:@"[%@] - %@",title, self.tf_summary.text]];
            // 设置收件人
            [mailCompose setToRecipients:@[@"xaoxuu@gmail.com"]];
            NSString *emailContent = self.tv_content.text;
            [mailCompose setMessageBody:emailContent isHTML:NO];
        } completion:^(MFMailComposeResult result) {
            
            [UIAlertController ax_showAlertWithTitle:NSStringFromNSInteger(result) message:nil action:nil];
        } fail:^(NSError *error) {
            
        }];
    }];
    [view ax_eachButtonInvokeAction:^(__kindof UIButton * _Nonnull button) {
        [button ax_addTouchUpInsideHandler:^(__kindof UIButton * _Nonnull sender) {
            

        }];
    }];
}



@end
