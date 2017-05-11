//
//  ThemeColorTableView.m
//  AXKit
//
//  Created by xaoxuu on 09/05/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "ThemeColorTableView.h"
#import "SCLAlertView+AXWrapper.h"

@implementation ThemeColorTableView


- (NSArray<BaseTableModelList *> *)dataListForTableView:(UITableView *)tableView{
    return services.json.colors;
}

- (UIImage *)tableViewCellIconForSection:(NSUInteger)section row:(NSUInteger)row{
    ThemeColorModel *model = services.json.colors[section].rows[row];
    return [UIImage imageWithColor:[UIColor colorWithHexString:model.hex]];
}

- (void)tableViewCellDidSelected:(__kindof BaseTableModel *)model{
    [services.app applyThemeWithColor:model];
}


- (NSString *)tableViewCellDetailForSection:(NSUInteger)section row:(NSUInteger)row{
    ThemeColorModel *colorStr = services.json.colors[section].rows[row];
    return [NSString stringWithFormat:@"%@",colorStr.hex];
}

@end
