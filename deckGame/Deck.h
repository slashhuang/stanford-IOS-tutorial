//
//  Deck.h
//  deckGame
//
//  Created by slashhuang's mac on 16/2/16.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;//两个参数return void
-(void)addCard:(Card *)card;//参数类型不同也是不同的函数
-(Card *)drawRandomCard;

@end
