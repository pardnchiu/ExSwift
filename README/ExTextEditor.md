# ExTextEditor 文檔

## 概述
ExTextEditor 是 UITextView 的擴展類，提供增強的多行文字輸入功能，包含自定義佔位符和豐富的配置選項。

## 特性
- 內建佔位符支持
    - 自動處理顯示/隱藏
    - 繼承文字視圖字體
    - 淺灰色預設外觀
- 零邊距預設配置
- 自動高度調整
- 完整的鍵盤管理
- 支持富文本

## 初始化
```swift
// 創建基本文字視圖
let textEditor = ExTextEditor()

// 創建帶代理的文字視圖
let textEditor = ExTextEditor(delegate: self)

// 創建帶子視圖的文字視圖
let textEditor = ExTextEditor {
    overlayView1
    overlayView2
}

// 使用變量引用
var myTextEditor: ExTextEditor?
ExTextEditor(&myTextEditor, delegate: self);
```

## 文字配置

### text 方法
```swift
func text(
    _ value: String? = nil,           // 文字內容
    color: UIColor? = nil,            // 文字顏色
    alignment: NSTextAlignment? = nil, // 對齊方式
    type: UITextContentType? = nil,    // 文字類型
    placeholder: String? = nil         // 佔位文字
) -> Self

// 示例
textEditor.text("輸入內容", color: .black, alignment: .left, placeholder: "請輸入...");
```

## 佔位符功能

### placeholder 屬性
```swift
var placeholder: String? { get set }

// 示例
textEditor.placeholder = "請輸入詳細描述";
```

## 字體設置

### font 方法
```swift
func font(
    _ value: UIFont? = nil,         // 字體
    name: String? = nil,            // 字體名稱
    size: CGFloat? = nil,           // 字體大小
    weight: UIFont.Weight? = nil,   // 字重
    italic: Bool? = nil             // 是否斜體
) -> Self

// 示例
textEditor.font(size: 16, weight: .regular, italic: false);
```

## 鍵盤配置

### keyboard 方法
```swift
func keyboard(
    type: UIKeyboardType? = nil,             // 鍵盤類型
    appearance: UIKeyboardAppearance? = nil, // 鍵盤外觀
    returnKey: UIReturnKeyType? = nil        // 返回鍵類型
) -> Self

// 示例
textEditor.keyboard(type: .default, appearance: .light, returnKey: .done);
```

## 使用示例

### 基本配置
```swift
let textEditor = ExTextEditor()
    .text(placeholder: "請輸入詳細描述")
    .font(size: 16)
    .frame(height: 150);
```

### 完整配置
```swift
let textEditor = ExTextEditor(delegate: self)
    .text(color: .black,  alignment: .left, placeholder: "請輸入您的建議...")
    .font(size: 16, weight: .regular)
    .keyboard(type: .default, returnKey: .done)
    .frame(height: 200);
```

## 注意事項

### 1. 邊距處理
- 預設清除所有邊距
- `contentInset` 設為 zero
- `textContainerInset` 設為 zero
- `lineFragmentPadding` 設為 0

### 2. 高度約束
- 使用 frame 設置高度會自動添加約束
- 約束優先級為 `.defaultHigh`

### 3. 佔位符
- 自動跟隨文字視圖字體變化
- 支持動態顯示/隱藏
- 使用通知中心監聽文字變化

### 4. 記憶體管理
- 在 deinit 時自動移除通知觀察者

### 5. 自動佈局
- 完整支持自動佈局系統
- 自動處理約束激活

## 最佳實踐

1. 設置合適的高度
   ```swift
   textEditor.frame(height: 150)  // 設置固定高度
   ```
2. 配置佔位符
   ```swift
   textEditor.text(
       placeholder: "請輸入...",
       color: .black
   )
   ```
3. 處理鍵盤
   ```swift
   textEditor
       .keyboard(returnKey: .done)
       .delegate(self)
   ```
4. 自定義外觀
   ```swift
   textEditor
       .font(size: 16, weight: .regular)
       .background(color: .systemGray6)
       .radius(8)
   ```
