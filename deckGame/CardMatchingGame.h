//
//  CardMatchingGame.h
//  deckGame
//
//  Created by slashhuang's mac on 16/2/17.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame:NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;//readonly means the propery only has a getter [no setter!!!]

@end