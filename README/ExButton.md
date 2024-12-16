# ExButton 文檔

## 概述
ExButton 是一個強大的 UIButton 擴展類，提供豐富的配置選項和狀態管理功能，支持鏈式調用和聲明式語法。

## 初始化
```swift
// 創建空按鈕
let button = ExButton();

// 創建帶標題的按鈕
let button = ExButton("標題", subTitle: "副標題");

// 創建帶子視圖的按鈕
let button = ExButton {
    customView1
    customView2
};

// 使用變量引用
var myButton: ExButton?
ExButton(&myButton, "標題");
```

## 外觀設置

- ### 背景配置
    ```swift
    // 設置背景顏色或圖片
    button.background(
        for: .normal,                    // 按鈕狀態
        color: .blue,                    // 背景顏色
        image: UIImage(named: "bg"),     // 背景圖片
        contentMode: .scaleAspectFill,   // 內容模式
        tintColor: .white                // 色調顏色
    )

    // 使用狀態構建器
    button.background {
        .normal(color: .blue)
        .highlighted(color: .lightBlue)
        .disabled(color: .gray)
    }
    ```
- ### 圓角設置
    ```swift
    // 設置圓角
    button.radius(10, corner: [.topLeft, .bottomRight])
    ```
- ### 文字設置
    ```swift
    // 設置文字內容和樣式
    button.text(
        for: .normal,                    // 按鈕狀態
        "按鈕文字",                      // 主標題
        subTitle: "副標題",              // 副標題
        color: .white,                   // 文字顏色
        alignment: .center,              // 文字對齊
        verticalAlignment: .center,      // 垂直對齊
        horzontalAlignment: .center      // 水平對齊
    )

    // 使用狀態構建器
    button.text {
        .normal("正常狀態", color: .black)
        .highlighted("按下狀態", color: .gray)
        .disabled("禁用狀態", color: .lightGray)
    }
    ```
- ### 字體設置
    ```swift
    // 設置主標題字體
    button.font(
        for: .normal,                    // 按鈕狀態
        .systemFont(ofSize: 16),         // 字體
        name: "Arial",                   // 字體名稱
        size: 16,                        // 字體大小
        weight: .bold,                   // 字重
        italic: false                    // 是否斜體
    )

    // 設置副標題字體
    button.subTitleFont(
        for: .normal,
        .systemFont(ofSize: 14),
        weight: .regular
    )

    // 使用狀態構建器
    button.font {
        .normal(size: 16, weight: .bold)
        .highlighted(size: 16, weight: .regular)
    }
    ```
- ### 圖片設置
    ```swift
    // 設置按鈕圖片
    button.image(
        for: .normal,                    // 按鈕狀態
        UIImage(named: "icon"),          // 圖片
        size: CGSize(width: 24, height: 24), // 尺寸
        radius: 12,                      // 圓角
        placement: .leading,             // 位置
        gap: 8                          // 間距
    )

    // 使用狀態構建器
    button.image {
        .normal(UIImage(named: "normal"))
        .highlighted(UIImage(named: "highlighted"))
    }
    ```
- ### 內邊距設置
    ```swift
    // 設置內邊距
    button.padding(
        for: .normal,                    // 按鈕狀態
        16,                             // 統一內邊距
        vertical: 12,                    // 垂直內邊距
        horizontal: 16                   // 水平內邊距
    )

    // 使用狀態構建器
    button.padding {
        .normal(vertical: 12, horizontal: 16)
        .highlighted(vertical: 10, horizontal: 14)
    }
    ```

## 事件處理

- ### 選擇器方式
    ```swift
    button.onTouch(.touchUpInside, #selector(buttonTapped))
    ```
- ### 閉包方式
    ```swift
    button.onTouch(.touchUpInside) { button in
        // 處理點擊事件
    }
    ```

## 條件配置
```swift
button.if(shouldApplyStyle) { button in
    button.background(color: .blue)
        .text("特殊樣式")
        .font(size: 18, weight: .bold)
}
```

## 自動佈局
ExButton 支持自動佈局系統：
- 自動激活約束
- 支持在滾動視圖中使用
- 自動更新框架大小

### 示例
```swift
let button = ExButton("標題")
    .background(color: .blue)
    .text(color: .white)
    .font(size: 16, weight: .bold)
    .radius(8)
    .padding(vertical: 12, horizontal: 16)
    .onTouch(.touchUpInside) { button in
        print("按鈕被點擊")
    }
```

## 狀態管理
ExButton 提供完整的狀態管理系統，支持：
- `.normal`：正常狀態
- `.highlighted`：高亮狀態
- `.disabled`：禁用狀態
- `.selected`：選中狀態
- `.focused`：焦點狀態

每個狀態都可以配置：
- 背景顏色和圖片
- 文字內容和樣式
- 字體設置
- 圖片設置
- 內邊距
