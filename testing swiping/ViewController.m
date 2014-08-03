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
    NSMutableArray *loadedCards;
}
@end

@implementation ViewController

//this makes it so only two cards are loaded at a time to
//avoid performance and memory costs
static const NSInteger MAX_BUFFER_SIZE = 2;

//all of the cards, not just what has been loaded
@synthesize allCards;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    allCards = [[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil]; //%%% placeholder for card-specific information
    loadedCards = [[NSMutableArray alloc] init];
    index = 0;
    [self loadCards];
	
    // Do any additional setup after loading the view, typically from a nib.
}


-(DraggableView *)createDraggableView
{
    draggableView = [[DraggableView alloc]initWithFrame:CGRectMake(60, 140, 200, 260)];
    draggableView.information.text = [allCards objectAtIndex:index]; //%%% placeholder for card-specific information
    draggableView.delegate = self;
    return draggableView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadCards
{
    if([allCards count] > 0) {
        NSRange range;
        range.length = (([allCards count] > MAX_BUFFER_SIZE)?MAX_BUFFER_SIZE:[allCards count]);
        range.location = index;
        loadedCards = [[allCards subarrayWithRange:range] mutableCopy];
        while (index < (NSInteger)[loadedCards count]) {
            [self.view insertSubview:[self createDraggableView] atIndex:(MAX_BUFFER_SIZE - index)];
            index++;
        }
    }
}


-(void)cardSwipedLeft:(UIView *)card;
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    if (index < [allCards count]) {
        [loadedCards addObject:[allCards objectAtIndex:index]];
        [self.view insertSubview:[self createDraggableView] atIndex:(MAX_BUFFER_SIZE - index)];
        index++;
    } else {
        UILabel *noMoreCards = [[UILabel alloc]initWithFrame:CGRectMake(120, 200, 200, 50)];
        noMoreCards.text = @"No more :(";
        [self.view addSubview:noMoreCards];
    }
    
}

-(void)cardSwipedRight:(UIView *)card
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    if (index < [allCards count]) {
        [loadedCards addObject:[allCards objectAtIndex:index]];
        [self.view insertSubview:[self createDraggableView] atIndex:(MAX_BUFFER_SIZE - index)];
        index++;
    } else {
        UILabel *noMoreCards = [[UILabel alloc]initWithFrame:CGRectMake(120, 200, 200, 50)];
        noMoreCards.text = @"No more :(";
        [self.view addSubview:noMoreCards];
    }
}

@end
