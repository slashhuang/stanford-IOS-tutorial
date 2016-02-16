//
//  Deck.m
//  deckGame
//
//  Created by slashhuang's mac on 16/2/16.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards;
@end

@implementation Deck
- (NSMutableArray *)cards{//内存空间的分配在getter方法中
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];//如果没有就分配空间(lazy instance)
    }
    return  _cards;
}
- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}
- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    if([self.cards count]){
        unsigned index = arc4random()%[self.cards count];
        //[]和执行函数objectAtIndexedSubscript to the array效果一致
        randomCard =self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
