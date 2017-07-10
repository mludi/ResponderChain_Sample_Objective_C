//
//  MyProtocol.h
//  ResponderChainDemoObjective
//
//  Created by Matthias Ludwig on 10.07.17.
//  Copyright © 2017 Matthias Ludwig. All rights reserved.
//

#ifndef MyProtocol_h
#define MyProtocol_h

@protocol MyProtocol <NSObject>

@optional
- (void)firstButtonTouchUpInside:(UIButton *)inSender;
- (void)secondButtonTouchUpInside:(UIButton *)inSender;

@end


#endif /* MyProtocol_h */
