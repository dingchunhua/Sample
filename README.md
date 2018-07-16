# Sample
Some simple examples

### 链式语法
```objc

Calculator *calculator = [[Calculator alloc] init];
CGFloat result = calculator.addition(10).subtract(5).subtract(2).multiply(3).division(4).calculate;
NSLog(@"%f", result);
    
```