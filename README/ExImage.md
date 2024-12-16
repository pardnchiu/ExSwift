# ExImage 文檔

## 概述
ExImage 是 UIImageView 的擴展類，提供增強的圖片處理、輪播功能和智能尺寸調整。

## 特性

### 1. 智能尺寸處理
- 自動適應圖片原始尺寸
- 智能縮放以適應視圖邊界
- 保持圖片比例

### 2. 輪播功能
- 支持多圖片輪播
- 可配置輪播間隔
- 支持開關控制

### 3. 圖片優化
- 自動處理過大圖片
- 支持色調調整
- 多種內容模式

### 4. 自動佈局支持
- 完全支持 Auto Layout
- 智能約束管理
- 自動更新框架大小

## 初始化
```swift
// 創建空圖片視圖
let imageView = ExImage();

// 創建帶單張圖片的視圖
let imageView = ExImage(UIImage(named: "photo"));

// 創建輪播圖片視圖
// 輪播圖片無法設置 Background / Radius
let imageView = ExImage(
    [image1, image2, image3],
    sec: 2  // 輪播間隔時間
);

// 創建帶子視圖的圖片視圖
let imageView = ExImage {
    overlayView1
    overlayView2
};

// 使用變量引用
var myImage: ExImage?
ExImage(&ExImage, UIImage(named: "photo"));
```

## 圖片設置

### image 方法
設置或更新圖片內容和樣式。
```swift
func image(
    _ imageTarget: UIImage? = nil,  // 目標圖片
    tintColor: UIColor? = nil,      // 色調顏色
    mode: UIView.ContentMode? = nil  // 內容模式
) -> Self

// 示例
// 設置基本圖片
imageView.image(UIImage(named: "photo"));

// 設置帶色調的圖片
imageView.image(UIImage(named: "icon"), tintColor: .blue);

// 設置帶顯示模式的圖片
imageView.image(UIImage(named: "background"), mode: .scaleAspectFill);
```

## 輪播功能

### carousel 方法
設置圖片輪播。
```swift
func carousel(
    _ list: [UIImage]? = nil,     // 輪播圖片陣列
    sec: Double? = nil,           // 輪播間隔時間
    state: ExSwitchState? = nil   // 輪播狀態
) -> Self

// 示例
// 基本輪播設置
imageView.carousel([image1, image2, image3], sec: 2.0);

// 設置輪播狀態
imageView.carousel([image1, image2, image3], sec: 2.0, state: .on); // 開始輪播
```

## 尺寸調整

### resizeToFit 方法
智能調整圖片尺寸以適應視圖大小。
```swift
func resizeToFit(
    _ mode: ExContentMode? = nil  // 調整模式
) -> Self

// 示例
// 自動調整尺寸
imageView.resizeToFit();

// 指定調整模式
imageView.resizeToFit(.scaleAspectFill);
```

## 使用示例

### 基本圖片顯示
```swift
let imageView = ExImage(UIImage(named: "photo"))
    .image(tintColor: .blue);
```

### 設置輪播
```swift
let imageView = ExImage()
    .carousel([image1, image2, image3], sec: 2.0, state: .on);
```

### 複雜配置
```swift
let imageView = ExImage(UIImage(named: "background"))
    .image(mode: .scaleAspectFill);
```

### 在滾動視圖中使用
```swift
let scrollView = ExVScroll();
scrollView.subvuew {
    ExImage(UIImage(named: "photo"))
}
```

## 最佳實踐

### 1. 圖片尺寸處理
- 大圖片使用前先調整尺寸
- 根據需要選擇適當的內容模式
- 使用 `resizeToFit` 進行智能調整

### 2. 輪播設置
- 輪播圖片建議預先處理到合適尺寸
- 合理設置輪播間隔時間
- 注意記憶體使用

### 3. 自動佈局
- 設置適當的約束
- 考慮圖片加載對佈局的影響
- 在需要時使用 `resizeToFit`
