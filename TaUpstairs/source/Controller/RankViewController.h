//
//  RankViewController.h
//  TaUpstairs
//
//  Created by Micro_Cai on 14-3-19.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property NSArray *items;
@end
