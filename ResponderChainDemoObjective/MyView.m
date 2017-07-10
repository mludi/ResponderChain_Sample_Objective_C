//
//  MyView.m
//  ResponderChainDemoObjective
//
//  Created by Matthias Ludwig on 10.07.17.
//  Copyright © 2017 Matthias Ludwig. All rights reserved.
//

#import "MyView.h"
#import "MyProtocol.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [firstButton addTarget:nil action:@selector(firstButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside]; // responderchain
        [firstButton setTitle:@"First Button" forState:UIControlStateNormal];
        
        UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [secondButton addTarget:nil action:@selector(secondButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside]; // responderchain
        [secondButton setTitle:@"Second Button" forState:UIControlStateNormal];
        
        
        UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[firstButton, secondButton]];
        stackView.translatesAutoresizingMaskIntoConstraints = NO;
        stackView.axis = UILayoutConstraintAxisVertical;
        stackView.spacing = 20.0f;
        stackView.alignment = UIStackViewAlignmentCenter;
        stackView.distribution = UIStackViewDistributionFillEqually;
        [self addSubview:stackView];
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [stackView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
                                                  ]
         ];
        
    }
    return self;
}

@end
