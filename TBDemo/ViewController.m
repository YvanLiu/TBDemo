//
//  ViewController.m
//  TBDemo
//
//  Created by 柳玉峰 on 2017/4/6.
//  Copyright © 2017年 柳玉峰. All rights reserved.
//


#import "ViewController.h"
#import "CollectionCell.h"
#import "LongTouchView.h"
@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_S(0xf3f3f3);
    [self buildCollectionView];
    [self reloadDataSource];
}

- (void)reloadDataSource {
    self.dataSource = [[NSMutableArray alloc]init];
    for (int i = 1; i<=25; i++) {
        NSString *name = [NSString stringWithFormat:@"美女%02d",i];
        [self.dataSource addObject:name];
    }
}

- (void)buildCollectionView {
   
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = CLEAR_COLOR;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:CELL_ID];
    
    // 1.在UICollectiong上添加长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    longPress.allowableMovement = YES;
    [self.collectionView addGestureRecognizer:longPress];

}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 0, 5, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH/2-1, ((SCREEN_WIDTH/2-1)/2)*3+50);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.01;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.01;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"touch");
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    cell.iconIMV.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
    cell.nameLbl.text = self.dataSource[indexPath.row];
    [cell.iconIMV mas_updateConstraints:^(MASConstraintMaker *make) {
        if (indexPath.row%2==0) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(-5);
        } else {
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(0);
        }
    }];
   
    return cell;
}

- (void)longPressGesture:(UILongPressGestureRecognizer *)gestureRecognizer {
    // 2.判断是否是确定了手势类型，如果是确定手势类型，就继续往下走，
    //   这里之前使用了UIGestureRecognizerStateEnded 效果并不好，要松开手指之后才能触发方法
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan) {
        return;
    }
    // 3.拿到点击的位置，通过位置获取indexPath
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
   
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        // 4.这里是自己简单写的弹框。
        LongTouchView *touchView = [LongTouchView sharManager];
        touchView.iconIMV.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
        touchView.nameLabel.text = self.dataSource[indexPath.row];
        [touchView show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
