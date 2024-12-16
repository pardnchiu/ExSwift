# ExStack 系列文檔

## 概述
ExStackView 系列提供了基於 UIStackView 的擴展類，包括：
- `ExStackView`：基礎堆疊視圖類
- `ExHStack`：水平堆疊視圖
- `ExVStack`：垂直堆疊視圖
- `ExStack`：通用堆疊視圖

### 特性
- 自動計算內容大小
- 智能約束管理
- 支持滾動視圖集成
- 限制分佈方式為 `.fillEqually` 或 `.equalSpacing`

### 配置設定
```swift
func config(
    axis: NSLayoutConstraint.Axis = .vertical,
    distribution: Distribution = .equalSpacing,
    alignment: Alignment = .fill,
    spacing: CGFloat = 0
) -> Self
```
配置堆疊視圖的基本屬性：
- `axis`：排列方向
- `distribution`：分佈方式
- `alignment`：對齊方式
- `spacing`：間距

### 子視圖管理
```swift
func subview(@ExViewBuilder _ builder: () -> [UIView]) -> Self
```
添加子視圖，支持聲明式語法。

### 條件執行
```swift
func `if`(button bool: Bool, _ _self: (ExScrollView) throws -> Void) rethrows -> Self
```
根據條件執行指定的代碼塊。

## ExHStack
水平堆疊視圖類，專門用於水平排列。

### 特性
- 強制水平排列（`.horizontal`）
- 限制對齊方式為 `.leading`、`.trailing`、`.center` 或 `.fill`
- 簡化的初始化選項

### 初始化方法
```swift
// 基本初始化
init(
    distribution: ExStackDistribution = .equalSpacing,
    verticalAlignment: ExStackVerticalAlignment = .fill,
    spacing: CGFloat = 0
)

// 帶子視圖初始化
init(
    distribution: ExStackDistribution = .equalSpacing,
    verticalAlignment: ExStackVerticalAlignment = .fill,
    spacing: CGFloat = 0,
    @ExViewBuilder subviewBuilder: () -> [UIView]
)

// 帶變量引用初始化
init(
    _ variable: inout ExStackView?,
    distribution: ExStackDistribution = .equalSpacing,
    verticalAlignment: ExStackVerticalAlignment = .fill,
    spacing: CGFloat = 0
)

// 帶變量引用和子視圖初始化
init(
    _ variable: inout ExStackView?,
    distribution: ExStackDistribution = .equalSpacing,
    verticalAlignment: ExStackVerticalAlignment = .fill,
    spacing: CGFloat = 0,
    @ExViewBuilder subviewBuilder: () -> [UIView]
)
```

## ExVStack
垂直堆疊視圖類，專門用於垂直排列。

### 特性
- 強制垂直排列（`.vertical`）
- 限制對齊方式為 `.top`、`.bottom`、`.center` 或 `.fill`
- 簡化的初始化選項

### 初始化方法
```swift
// 基本初始化
init(
    distribution: ExStackDistribution = .equalSpacing,
    horizontalAlignment: ExStackHorizontalAlignment = .fill,
    spacing: CGFloat = 0
)

// 帶子視圖初始化
init(
    distribution: ExStackDistribution = .equalSpacing,
    horizontalAlignment: ExStackHorizontalAlignment = .fill,
    spacing: CGFloat = 0,
    @ExViewBuilder subviewBuilder: () -> [UIView]
)

// 帶變量引用初始化
init(
    _ variable: inout ExStackView?,
    distribution: ExStackDistribution = .equalSpacing,
    horizontalAlignment: ExStackHorizontalAlignment = .fill,
    spacing: CGFloat = 0
)

// 帶變量引用和子視圖初始化
init(
    _ variable: inout ExStackView?,
    distribution: ExStackDistribution = .equalSpacing,
    horizontalAlignment: ExStackHorizontalAlignment = .fill,
    spacing: CGFloat = 0,
    @ExViewBuilder subviewBuilder: () -> [UIView]
)
```

## ExStack
通用堆疊視圖類，支持自定義配置。

### 特性
- 可配置排列方向
- 支持所有標準對齊方式
- 完整的配置選項

### 初始化方法
```swift
// 基本初始化
init(
    axis: NSLayoutConstraint.Axis = .vertical,
    distribution: ExStackDistribution = .equalSpacing,
    alignment: UIStackView.Alignment,
    spacing: CGFloat = 0
)

// 帶子視圖初始化
init(
    axis: NSLayoutConstraint.Axis = .vertical,
    distribution: ExStackDistribution = .equalSpacing,
    alignment: UIStackView.Alignment,
    spacing: CGFloat = 0,
    @ExViewBuilder subviewBuilder: () -> [UIView]
)

// 帶變量引用初始化
init(
    _ variable: inout ExStackView?,
    axis: NSLayoutConstraint.Axis = .vertical,
    distribution: ExStackDistribution = .equalSpacing,
    alignment: UIStackView.Alignment,
    spacing: CGFloat = 0
)

// 帶變量引用和子視圖初始化
init(
    _ variable: inout ExStackView?,
    axis: NSLayoutConstraint.Axis = .vertical,
    distribution: ExStackDistribution = .equalSpacing,
    alignment: UIStackView.Alignment,
    spacing: CGFloat = 0,
    @ExViewBuilder subviewBuilder: () -> [UIView]
)
```

## 使用示例

### 創建水平堆疊視圖
```swift
let hStack = ExHStack(
    distribution: .equalSpacing,
    verticalAlignment: .center,
    spacing: 10
) {
    leftView
    centerView
    rightView
}
```

### 創建垂直堆疊視圖
```swift
let vStack = ExVStack(
    distribution: .fillEqually,
    horizontalAlignment: .fill,
    spacing: 8
) {
    headerView
    contentView
    footerView
}
```

### 創建通用堆疊視圖
```swift
let stack = ExStack(
    axis: .vertical,
    distribution: .equalSpacing,
    alignment: .center,
    spacing: 12
) {
    topSection
    middleSection
    bottomSection
}
```

### 使用變量引用
```swift
var myStack: ExStackView?
ExHStack(&myStack, distribution: .equalSpacing) {
    // 子視圖
}
```

### 在滾動視圖中使用
```swift
let scrollView = ExVScroll()
let stackView = ExVStack {
    // 長內容
}
scrollView.addSubview(stackView)
```
