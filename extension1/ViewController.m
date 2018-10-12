//
//  ViewController.m
//  extension1
//
//  Created by Amine Magma on 12/10/2018.
//  Copyright © 2018 Amine Magma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(25, [UIScreen mainScreen].bounds.size.width / 2 - 30, 0, 0)];
    [lab setText:@"Hello Word 😊"];
    [lab setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1]];
    [lab sizeToFit];
    [[self view] addSubview:lab];
}


@end
