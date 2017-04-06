仿照天猫App写的一个长按商品弹框的Demo
========
前两天买衣服发现的，长按弹出商品详情带分享收藏之类，觉得挺好玩的，果然大团队，果然别人家的产品，仿着写一个，没什么技术含量，纯闲着没事练手，手痒呀。。。

核心代码就这几句：
-----
```
// 1.在UICollectiong上添加长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    longPress.allowableMovement = YES;
    [self.collectionView addGestureRecognizer:longPress];
```
```
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

    } else {
        // 4.这里是自己简单写的弹框。
        LongTouchView *touchView = [LongTouchView sharManager];
        touchView.iconIMV.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
        touchView.nameLabel.text = self.dataSource[indexPath.row];
        [touchView show];
    }
}

```

