//
//  ViewController.h
//  ListSelect
//
//  Created by Jakey on 15/6/9.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_leftArray;
}
@property (weak, nonatomic) IBOutlet UITableView *lelftTable;

@property (weak, nonatomic) IBOutlet UITableView *rightTable;
@end

