//
//  ViewController.m
//  image processor
//
//  Created by 徐纪光 on 15/4/25.
//  Copyright (c) 2015年 徐纪光. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    names = [NSArray arrayWithObjects:@"rabbit",@"watermelon", nil];
    covers = [NSArray arrayWithObjects:@"first",@"second", nil];
    
     UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    //设置内容样式,通过保持长宽比缩放内容适应视图的大小,任何剩余的区域的视图的界限是透明的。
    UIImage *image = [UIImage imageNamed:@"title.png"];
    //初始化图像视图
    [imageView setImage:image];
    self.navigationItem.titleView = imageView;//设置导航栏的titleView为imageView
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.headerReferenceSize = CGSizeMake([[UIScreen mainScreen]bounds].size.width, 10);//头部
    
//    self.collection.collectionViewLayout = flowlayout;
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
    
    
    self.collection.dataSource = self;
    self.collection.delegate = self;
    self.collection.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.collection];
    
    [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    [cell sizeToFit];
    if(!cell){
        NSLog(@"error");
    }
    cell.imgView.image = [UIImage imageNamed:@"first.png"];
    cell.text.text = @"rabbit";
    return cell;

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
