# SliderDemo
iOS中滑块UISlider的使用demo

## 示例图
![](https://github.com/Cloudox/SliderDemo/blob/master/UISliderScreen.png)

## 介绍
如上图所示，在图中有四个内容：滑动条本身、最小值label、最大值label、当前值label。
随着滑动条的左右滑动，中间的当前值label会跟着做出变化。

## 制作方法
### 1. 首先我们要创建滑动条，这是肯定的，创建代码如下:

```objective-c
// 滑动条slider  
UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((SCREENWIDTH - 150) / 2, 200, 150, 20)];  
[self.view addSubview:slider];  
```

我是用纯代码创建的，当然也可以直接在storyboard中拖一个到界面上，那样其实很简单，就不说了。  
宽度我用了一个自定义的屏幕宽度常量。这里要注意的一点是，滑动条的高度，如果设为0，其实还是会正常显示。`但是！一旦高度设为0，滑动条将不能左右滑动！`我就入过这个坑。。。找了半天没找到原因，最终发现是这里的问题。  
当然我们还仅仅定义了滑动条的位置，还有很多属性没有定义，我们接着设置：

```objective-c
    // 滑动条slider  
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((SCREENWIDTH - 150) / 2, 200, 150, 20)];  
    slider.minimumValue = 9;// 设置最小值  
    slider.maximumValue = 11;// 设置最大值  
    slider.value = (slider.minimumValue + slider.maximumValue) / 2;// 设置初始值  
    slider.continuous = YES;// 设置可连续变化  
//    slider.minimumTrackTintColor = [UIColor greenColor]; //滑轮左边颜色，如果设置了左边的图片就不会显示  
//    slider.maximumTrackTintColor = [UIColor redColor]; //滑轮右边颜色，如果设置了右边的图片就不会显示  
//    slider.thumbTintColor = [UIColor redColor];//设置了滑轮的颜色，如果设置了滑轮的样式图片就不会显示  
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值变化添加响应方法  
    [self.view addSubview:slider];  
```

如上所示，在代码中，我们设置了最大值、最小值、当前值。也可以改变滑动条左边、右边一集滑块本身的颜色，不过我们这里采用默认的设置，更改方法代码中也写了。除了可以设置颜色外，还可以设置最大最小值处的图片。  
现在我们注意一个设置：slider.continuous = YES; 这个设置有什么用呢？设为YES后，我们才能在拖动滑块的过程中持续获取其值变更事件，如果是NO，则只有在滑动停止时才会获取变更事件。  
这个变更事件又是什么呢？我们只是对一个按钮设置响应方法的时候，设置的响应事件是Touch up inside。在滑动条中，相对应的就是ValueChanged。所以我们设置响应方法时，也是针对的这个方法。

### 2. 滑动条创建完毕后，接着创建那三个label：

创建labelde代码很常见，这里就直接贴出来了：

```objective-c
// 当前值label  
self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH - 100) / 2, slider.frame.origin.y + 30, 100, 20)];  
self.valueLabel.textAlignment = NSTextAlignmentCenter;  
self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];  
[self.view addSubview:self.valueLabel];  
  
// 最小值label  
UILabel *minLabel = [[UILabel alloc] initWithFrame:CGRectMake(slider.frame.origin.x - 35, slider.frame.origin.y, 30, 20)];  
minLabel.textAlignment = NSTextAlignmentRight;  
minLabel.text = [NSString stringWithFormat:@"%.1f", slider.minimumValue];  
[self.view addSubview:minLabel];  
  
// 最大值label  
UILabel *maxLabel = [[UILabel alloc] initWithFrame:CGRectMake(slider.frame.origin.x + slider.frame.size.width + 5, slider.frame.origin.y, 30, 20)];  
maxLabel.textAlignment = NSTextAlignmentLeft;  
maxLabel.text = [NSString stringWithFormat:@"%.1f", slider.maximumValue];  
[self.view addSubview:maxLabel];  
```

这里值得注意的是，我们label的值并不是直接定义的，而是获取滑动条的最大、最小、当前值，然后取小数点前一位显示的，因为滑动条是连续变化的，其值是浮点型的连续小数，如果不取小数点后的位数，得到的将是没有规律的小数。

### 3. 现在来看拖动滑动条时的响应方法：

我们要做到的是当前值的label显示的内容随着滑动条的滑动而变化，那么只需要在滑动条的响应方法中设置label的显示内容就可以了，注意同样要取小数点前一位：

```objective-c
// slider变动时改变label值  
- (void)sliderValueChanged:(id)sender {  
    UISlider *slider = (UISlider *)sender;  
    self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];  
}  
```

因为我们continuous设为了YES，所以显示的当前值会随着拖动实时改变。

更多查看[我的博客](http://blog.csdn.net/cloudox_/article/details/51099187)
