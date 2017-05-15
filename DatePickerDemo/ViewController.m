//
//  ViewController.m
//  DatePickerDemo
//
//  Created by Rana on 4/19/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIDatePicker *datePicker;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma getting date from picker
- (void)pickerChanged
{
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"dd-MM-yyyy"]; // Date formater
    NSString *date = [dateformate stringFromDate:[datePicker date]]; // Convert date to string
    NSLog(@"date :%@",date);
    self.showDate.text = date;
    
    [self.showDate.layer addSublayer:[self prefix_addUpperBorder:UIRectEdgeTop color:[UIColor redColor] thickness:1.0 CGRect:self.showDate.frame]];

    [self pre];
    
}

- (CALayer *)prefix_addUpperBorder:(UIRectEdge)edge color:(UIColor *)color thickness:(CGFloat)thickness CGRect:(CGRect) rect
{
    CALayer *border = [CALayer layer];
    
    switch (edge) {
        case UIRectEdgeTop:
            border.frame = CGRectMake(0, 0, CGRectGetWidth(rect), thickness);
            break;
        case UIRectEdgeBottom:
            border.frame = CGRectMake(0, CGRectGetHeight(rect) - thickness, CGRectGetWidth(rect), thickness);
            break;
        case UIRectEdgeLeft:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(rect));
            break;
        case UIRectEdgeRight:
            border.frame = CGRectMake(CGRectGetWidth(rect) - thickness, 0, thickness, CGRectGetHeight(rect));
            break;
        default:
            break;
    }
    
    border.backgroundColor = color.CGColor;
    
    return border;
}

- (IBAction)pickDate:(id)sender {
    //Add the picker
    UIView *viewDatePicker = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [viewDatePicker setBackgroundColor:[UIColor clearColor]];
    
    //Make a frame for the picker & then create the picker
    CGRect pickerFrame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    datePicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.hidden = NO;
    [viewDatePicker addSubview:datePicker];
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:@"\n\n\n\n\n\n\n\n\n\n"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController.view addSubview:viewDatePicker];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                 {
                                     //Detect particular click by tag and do some thing here
                                     
                                     [self pickerChanged];
                                     NSLog(@"OK action");
                                     
                                 }];
    [alertController addAction:doneAction];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
