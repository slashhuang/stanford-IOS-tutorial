//
//  Card.h
//  deckGame
//
//  Created by slashhuang's mac on 16/2/16.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;
-(int)match:(NSArray *)otherCards;
@end
