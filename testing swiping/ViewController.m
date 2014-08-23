//
//  ViewController.m
//  testing swiping
//
//  Created by Richard Kim on 5/21/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//
//  @cwRichardKim for updates and requests

#import "ViewController.h"



@interface ViewController () {
    DraggableView *draggableView;
    NSInteger index;
    NSMutableArray *loadedcardLabels;
    NSMutableArray *viewableCards;
    
    UIButton* menuButton;
    UIButton* messageButton;
    UIButton* checkButton;
    UIButton* xButton;
}
@end

@implementation ViewController

//this makes it so only two cards are loaded at a time to
//avoid performance and memory costs
static const NSInteger MAX_BUFFER_SIZE = 2;

//all of the cards, not just what has been loaded
@synthesize allCardLabels;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    allCardLabels = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5", nil]; //%%% placeholder for card-specific information
    loadedcardLabels = [[NSMutableArray alloc] init];
    viewableCards = [[NSMutableArray alloc] init];
    index = 0;
    [self loadCards];
	
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setupView
{
    //%%%TODO: change these to ratios
    self.view.backgroundColor = [UIColor colorWithRed:.92 green:.93 blue:.95 alpha:1];
    menuButton = [[UIButton alloc]initWithFrame:CGRectMake(17, 34, 22, 15)];
    [menuButton setImage:[UIImage imageNamed:@"menuButton"] forState:UIControlStateNormal];
    messageButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 34, 18, 18)];
    [messageButton setImage:[UIImage imageNamed:@"messageButton"] forState:UIControlStateNormal];
    xButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 485, 59, 59)];
    [xButton setImage:[UIImage imageNamed:@"xButton"] forState:UIControlStateNormal];
    [xButton addTarget:self action:@selector(swipeLeft) forControlEvents:UIControlEventTouchUpInside];
    checkButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 485, 59, 59)];
    [checkButton setImage:[UIImage imageNamed:@"checkButton"] forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(swipeRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuButton];
    [self.view addSubview:messageButton];
    [self.view addSubview:xButton];
    [self.view addSubview:checkButton];
}


-(DraggableView *)createDraggableView
{
    draggableView = [[DraggableView alloc]initWithFrame:CGRectMake(15, 74, 290, 386)];
    draggableView.information.text = [allCardLabels objectAtIndex:index]; //%%% placeholder for card-specific information
    draggableView.delegate = self;
    [self.view addSubview:draggableView];
    [viewableCards addObject:draggableView];
    return draggableView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadCards
{
    if([allCardLabels count] > 0) {
        NSRange range;
        range.length = (([allCardLabels count] > MAX_BUFFER_SIZE)?MAX_BUFFER_SIZE:[allCardLabels count]);
        range.location = index;
        loadedcardLabels = [[allCardLabels subarrayWithRange:range] mutableCopy];
        while (index < (NSInteger)[loadedcardLabels count]) {
            [self.view insertSubview:[self createDraggableView] atIndex:(MAX_BUFFER_SIZE - index)];
            index++;
        }
    }
}


-(void)cardSwipedLeft:(UIView *)card;
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    if (index < [allCardLabels count]) {
        [loadedcardLabels addObject:[allCardLabels objectAtIndex:index]];
        [self.view insertSubview:[self createDraggableView] atIndex:(MAX_BUFFER_SIZE - index)];
        index++;
    } else {
//        UILabel *noMoreCards = [[UILabel alloc]initWithFrame:CGRectMake(120, 200, 200, 50)];
//        noMoreCards.text = @"No more :(";
//        [self.view addSubview:noMoreCards];
    }
    [viewableCards removeObjectAtIndex:0];
}

-(void)cardSwipedRight:(UIView *)card
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    if (index < [allCardLabels count]) {
        [loadedcardLabels addObject:[allCardLabels objectAtIndex:index]];
        [self.view insertSubview:[self createDraggableView] atIndex:(MAX_BUFFER_SIZE - index)];
        index++;
    } else {
//        UILabel *noMoreCards = [[UILabel alloc]initWithFrame:CGRectMake(120, 200, 200, 50)];
//        noMoreCards.text = @"No more :(";
//        [self.view addSubview:noMoreCards];
    }
    [viewableCards removeObjectAtIndex:0];
}

-(void)swipeRight
{
    DraggableView *dragView = [viewableCards firstObject];
    
    [dragView rightClickAction];
}

-(void)swipeLeft
{
    DraggableView *dragView = [viewableCards firstObject];
    
    [dragView leftClickAction];
}

@end
