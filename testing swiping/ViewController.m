//
//  ViewController.m
//  testing swiping
//
//  Created by Richard Kim on 5/21/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "ViewController.h"
#import "DraggableView.h"



@interface ViewController () {
    DraggableView *draggableView;
    NSInteger index;
}

@end

@implementation ViewController
@synthesize cardsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    cardsArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil]; //%%% placeholder for card-specific information
    index = 0;
    UILabel *noMoreCards = [[UILabel alloc]initWithFrame:CGRectMake(120, 200, 200, 50)];
    noMoreCards.text = @"No more :(";
    [self.view addSubview:noMoreCards];
    while (index < cardsArray.count) {
        [self setupDraggableView];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)setupDraggableView
{
    draggableView = [[DraggableView alloc]initWithFrame:CGRectMake(60, 60, 200, 260)];
    draggableView.information.text = [cardsArray objectAtIndex:index]; //%%% placeholder for card-specific information
    [self.view addSubview:draggableView];
    index++;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
