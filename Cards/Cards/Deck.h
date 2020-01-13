//
//  Deck.h
//  Cards
//
//  Created by Zhaonian Luan on 1/11/20.
//  Copyright © 2020 Zhaonian Luan. All rights reserved.
//

#ifndef Deck_h
#define Deck_h

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
#endif /* Deck_h */
