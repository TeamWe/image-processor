//
//  ViewController.h
//  image processor
//
//  Created by 徐纪光 on 15/4/25.
//  Copyright (c) 2015年 徐纪光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    NSArray *names;
    NSArray *covers;
}

@property(strong,nonatomic)UICollectionView *collection;

@end

