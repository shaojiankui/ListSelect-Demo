//
//  ViewController.m
//  ListSelect
//
//  Created by Jakey on 15/6/9.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _leftArray = @[
                  @{@"title":@"00",
                    @"list":@[@"aaa",@"aaa1",@"aaa"]
                    },
                  @{@"title":@"11",
                    @"list":@[@"aaa",@"aaa1"]
                    },
                  @{@"title":@"22",
                    @"list":@[@"aaa",@"aaa1",@"aaa"]
                    },
                  @{@"title":@"33",
                    @"list":@[@"aaa"]
                    },
                  @{@"title":@"44",
                    @"list":@[@"aaa",@"aaa1",@"aaa"]
                    },
                  @{@"title":@"55",
                    @"list":@[@"aaa"]
                    },
                  @{@"title":@"66",
                    @"list":@[@"aaa",@"aaa1",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]
                    },
                  @{@"title":@"77",
                    @"list":@[@"aaa",@"aaa1",@"aaa"]
                    },
                  @{@"title":@"88",
                    @"list":@[@"aaa",@"aaa1",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]
                    },
                  @{@"title":@"99",
                    @"list":@[@"aaa",@"aaa1",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]
                    },
                  @{@"title":@"1010",
                    @"list":@[@"aaa",@"aaa1",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]
                    },
                  @{@"title":@"1111",
                    @"list":@[@"aaa",@"aaa1",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]
                    },
                  @{@"title":@"1212",
                     @"list":@[@"aaa",@"aaa1",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]
                     }
                  
                  ];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.lelftTable) {
         return 1;
    }else{
        return [_leftArray count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.lelftTable) {
        return 40;
    }else{
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (tableView == self.lelftTable) {
        return 0;
    }else{
        //重要,或者0.01
        return CGFLOAT_MIN;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *item=[_leftArray objectAtIndex:section];

    if (tableView == self.lelftTable) {
        return [_leftArray count];
    }else{
        return [[item objectForKey:@"list"] count];
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor =[UIColor grayColor];
    if (tableView == self.lelftTable)
    {
        cell.textLabel.text = [_leftArray[indexPath.row] objectForKey:@"title"];
    }else
    {
        NSDictionary *item=[_leftArray objectAtIndex:indexPath.section];
        cell.textLabel.text = [item objectForKey:@"list"][indexPath.row];
    }
    //config the cell
    
    return cell;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    
    if (tableView == self.rightTable)
    {
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        view.backgroundColor = [UIColor grayColor];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:view.bounds];
        
        NSDictionary *item=[_leftArray objectAtIndex:section];
        lable.text = [item objectForKey:@"title"];
        
        [view addSubview:lable];
        return view;

    }else
    {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
    if (tableView == self.rightTable) {
       [self.lelftTable selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    }

}
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
    if (tableView == self.rightTable) {
        [self.lelftTable selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    }

}


@end