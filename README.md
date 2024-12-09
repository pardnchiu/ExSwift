此項目仍是2019年的舊版代碼
新版 Framework 正在優化中，後續將釋出給各位方便整合導入。

新版擴展特色與功能優化

新版擴展將對項目進行全面升級，針對各項擴展進行優化，並引入以下核心改進：
- 避免與原生方法衝突
  除了少量需要在原生擴展以外，剩餘自定義擴展功能將採用繼承方式，獨立命名空間，確保穩定性和兼容性。
- 統一命名與類型設計
  新版將對常見 UIKit 元件提供專屬子類，結構清晰，使用更靈活。
  例如：
  - UIView → ExView
  - UILabel → ExLabel
  - UIStackView → ExStackView
- 高效功能整合
新版框架將集成多項優化功能，簡化開發流程，提升代碼可讀性與可維護性。

## 範例

> [!Note]
> 快速構建複雜界面 使用鏈式語法與巢狀結構，無需冗長的屬性設定語句，即可快速構建層次清晰的 UI 元件，顯著提升代碼的可讀性與可維護性。

```Swift
var bool = false;
myView.subview([
    // 主容器視圖
    ExView()
        .frame(x: 0, y: 0, width: 300, height: 400) // 設置框架大小
        .background(color: .white) // 背景設為白色
        .subview([
            // 子視圖 1：標題容器
            ExView()
                .frame(x: 10, y: 10, width: 280, height: 50) // 設置大小與位置
                .background(color: .lightGray) // 背景設為淺灰
                .subview([
                    ExLabel()
                        .frame(x: 10, y: 10, width: 260, height: 30) // 設置標籤框架
                        .text("標題1", color: .red, alignment: .center) // 設置標題文字
                        .background(color: .clear) // 背景透明
                        .if(bool) { label in
                            label.text("標題2", color: .black, alignment: .center) // 設置標題文字
                        }
                ]),

            // 子視圖 2：按鈕容器
            ExView()
                .frame(x: 10, y: 70, width: 280, height: 300) // 按鈕容器框架
                .background(color: .gray) // 背景設為灰色
                .subview([
                    ExButton()
                        .frame(x: 20, y: 20, width: 120, height: 40) // 按鈕1框架
                        .background(color: .blue) // 按鈕默認背景藍色
                        .text("按鈕1", color: .red, state: .normal) // 按鈕文字紅色
                        .action(.touchUpInside) { button in
                            button
                                .background(color: .red) // 點擊後背景變紅
                                .text("已點擊", color: .white, state: .normal) // 文字變白
                        },
                    ExButton()
                        .frame(x: 140, y: 20, width: 120, height: 40) // 按鈕2框架
                        .background(color: .red, state: .normal) // 按鈕默認背景紅色
                        .background(color: .blue, state: .disabled) // 禁用時背景藍色
                        .text("按鈕2", color: .red, state: .normal) // 默認文字紅色
                        .text("已停用", state: .disabled) // 禁用時文字
                        .action(.touchUpInside) { button in
                            button.isEnabled = false // 點擊後禁用按鈕
                        }
                ])
        ])
])
```

<details>
<summary>ExView 擴展</summary>

## ExView

- `parentViewController`
    > [!Note]
    > 功能： 獲取當前視圖的父視圖控制器。
    ```Swift
    var parentViewController: UIViewController?
    ```
    ```Swift
    if let parentVC = myView.parentViewController {
        print("Parent VC: \(parentVC)")
    }
    ```
- `frame`
    > [!Note]
    > 功能： 設置視圖的 x、y 坐標和 width、height。
    ```Swift
    func frame(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) -> Self
    ```
    ```Swift
    myView.frame(x: 10, y: 20, width: 200, height: 100)
    ```
- `background`
    > [!Note]
    > 功能： 設置背景顏色或圖片，支持調整圖片的 tintColor。
    ```Swift
    func background(color: UIColor? = nil, image: UIImage? = nil, tintColor: UIColor? = nil) -> Self
    ```
    ```Swift
    myView.background(color: .red)
    myView.background(image: UIImage(named: "background"), tintColor: .blue)
    ```
- `alpha`
    > [!Note]
    > 功能： 設置視圖的透明度。
    ```Swift
    func alpha(_ value: CGFloat) -> Self
    ```
    ```Swift
    myView.alpha(0.5)
    ```
- `radius`
    > [!Note]
    > 設置視圖的圓角，支持針對特定角落應用不同的圓角值。
    ```Swift
    func radius(_ value: CGFloat? = nil, corner: [UIRectCorner]? = nil) -> Self
    ```
    ```Swift
    myView.radius(10, corner: [.topLeft, .bottomRight])
    ```
- `clip`
    > [!Note]
    > 功能： 是否裁剪子視圖或圖層內容。
    ```Swift
    func clip(view: Bool = true, layer: Bool = true) -> Self
    ```
    ```Swift
    myView.clip(view: true, layer: false)
    ```
- `shadow`
    > [!Note]
    > 功能： 添加陰影效果。
    ```Swift
    func shadow(x: CGFloat? = nil, y: CGFloat? = nil, blur: CGFloat? = nil, color: UIColor? = nil, alpha: Float? = nil) -> Self
    ```
    ```Swift
    myView.shadow(x: 5, y: 5, blur: 10, color: .black, alpha: 0.3)
    ```
- `border`
    > [!Note]
    >
    ```Swift
    func border(color: UIColor, width: CGFloat, target: [ExSwiftEdgeSet]? = nil) -> Self
    ```
    ```Swift
    myView.border(color: .blue, width: 2, target: [.trailing, .bottom])
    ```
- `scale`
    > [!Note]
    > 功能： 按比例縮放視圖。
    ```Swift
    func scale(width: CGFloat? = nil, height: CGFloat? = nil, ratio: CGFloat? = nil) -> Self
    ```
    ```Swift
    myView.scale(width: 150, height: 200)
    ```
- `rotate`
    > [!Note]
    > 功能： 旋轉視圖（以度為單位）。
    ```Swift
    func rotate(_ angle: CGFloat) -> Self
    ```
    ```Swift
    myView.rotate(45) // 旋轉 45 度
    ```
- `subview`
    > [!Note]
    > 功能： 添加多個子視圖。
    ```Swift
    func subview(_ views: [UIView]) -> Self
    ```
    ```Swift
    myView.subview([childView1, childView2])
    ```
- `sublayer`
    > [!Note]
    > 功能： 添加多個子圖層。
    ```Swift
    func sublayer(_ layers: [CALayer]) -> Self
    ```
    ```Swift
    myView.sublayer([layer1, layer2])
    ```
- `bringToFront`
    > [!Note]
    > 功能： 將指定子視圖移動到前景。
    ```Swift
    func bringToFront(_ views: [UIView]) -> Self
    ```
    ```Swift
    myView.bringToFront([childView])
    ```
- `draw`
    > [!Note]
    > 功能： 擷取當前視圖的畫面，返回圖片。
    ```Swift
    func draw(_ width: CGFloat, _ height: CGFloat, _ completion: @escaping (UIImage?) -> Void)
    ```
    ```Swift
    myView.draw(300, 400) { image in
        print(image);
    };
    ```
- `Constraint`
    - `leftEqualTo`
        > [!Note]
        > 設置視圖的左邊緣與另一個視圖對齊。
        ```Swift
        func leftEqualTo(left: UIView? = nil, centerX: UIView? = nil, right: UIView? = nil, _ value: CGFloat? = nil) -> Self
        ```
        ```Swift
        myView.leftEqualTo(left: otherView, value: 10)      // myView 的左邊距離 otherView 的左邊為 10
        myView.leftEqualTo(centerX: otherView, value: 0)    // myView 的左邊對齊 otherView 的水平中心
        myView.leftEqualTo(right: otherView, value: -15)    // myView 的左邊距離 otherView 的右邊為 -15
        ```
    - `leftGreaterThan`
        > [!Note]
        > 設置視圖的左邊緣相對另一視圖有最小距離。
        ```Swift
        func leftGreaterThan(left: UIView? = nil, centerX: UIView? = nil, right: UIView? = nil, _ value: CGFloat? = nil) -> Self
        ```
        ```Swift
        myView.leftGreaterThan(left: otherView, value: 20)      // myView 的左邊至少距離 otherView 的左邊 20
        myView.leftGreaterThan(centerX: otherView, value: 5)    // myView 的左邊至少距離 otherView 的水平中心 5
        myView.leftGreaterThan(right: otherView, value: 10)     // myView 的左邊至少距離 otherView 的右邊 10
        ```
    - `leftLessThan`
        > [!Note]
        >
        ```Swift
        func leftLessThan(left: UIView? = nil, centerX: UIView? = nil, right: UIView? = nil, _ value: CGFloat? = nil) -> Self
        ```
        ```Swift
        myView.leftLessThan(left: otherView, value: -5)     // myView 的左邊最多距離 otherView 的左邊 -5
        myView.leftLessThan(centerX: otherView, value: 0)   // myView 的左邊最多對齊 otherView 的水平中心
        myView.leftLessThan(right: otherView, value: -10)   // myView 的左邊最多距離 otherView 的右邊 -10
        ```
        ... 以此類推

</details>

<details>
<summary>ExLabel 擴展</summary>

## ExLabel

> [!Note]
> 包含 **ExView** 所有方法

- `text`
    > [!Note]
    > 功能： 設定標籤的文字、顏色、對齊方式、行數以及換行模式。
    ```Swift
    func text(_ value: String? = "", color: UIColor? = nil, alignment: NSTextAlignment? = nil, line: Int? = nil, breakMode: NSLineBreakMode? = nil) -> Self
    ```
    ```Swift
    label.text("Hello, World!", color: .black, alignment: .center, line: 1, breakMode: .byWordWrapping)
    ```
- `font`
    > [!Note]
    > 功能： 設定標籤文字的字體、字型名稱、大小、字重、是否斜體，以及是否調整字體大小以適應標籤大小。
    ```Swift
    func font(_ font: UIFont? = nil, name: String? = nil, size: CGFloat? = nil, weight: UIFont.Weight? = nil, italic: Bool? = nil, sizeToFit: Bool? = nil) -> Self
    ```
    ```Swift
    label.font(name: "Helvetica", size: 14, weight: .bold, italic: true, sizeToFit: true)
    ```
- `padding`
    > [!Note]
    > 功能： 設定標籤內邊距，支持統一設置或單方向設置。
    ```Swift
    func padding(_ value: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> ExLabel
    ```
    ```Swift
    label.padding(top: 8, left: 12, bottom: 8, right: 12)
    label.padding(8)   // 四邊一致
    label.padding()    // 四邊一致 (預設 16)
    ```
- `if`
    > [!Note]
    > 功能： 根據條件執行某段操作。
    ```Swift
    func `if`(label bool: Bool, _ _self: (UILabel) throws -> Void) rethrows -> Self
    ```
    ```Swift
    label.if(自訂條件為真) { label in
        label.textColor = .blue
    }
    ```

</details>

<details>
<summary>ExButton 擴展</summary>

## ExButton

> [!Note]
> 包含 **ExView** 所有方法

- `background`
    > [!Note]
    > 功能： 設定按鈕的背景色或背景圖片。
    ``` Swift
    func background(color: UIColor? = nil, image: UIImage? = nil, contentMode: UIView.ContentMode? = nil, tintColor: UIColor? = nil, state: UIControl.State? = nil) -> Self
    ```
    ```Swift
    button.background(color: .blue, state: .normal)
    button.background(image: UIImage(named: "background"), contentMode: .scaleAspectFill)
    ```
- `text`
    > [!Note]
    > 功能： 設定按鈕的標題文字、子標題、顏色和對齊方式。
    ```Swift
    func text(_ value: String? = nil, subtitle: String? = nil, color: UIColor? = nil, alignment: UIButton.Configuration.TitleAlignment? = nil, state: UIControl.State? = nil) -> Self
    ```
    ```Swift
    button.text("確認", subtitle: "請點擊確認", color: .white, alignment: .center, state: .normal)
    ```
- `font`
    > [!Note]
    > 功能： 設定按鈕標題文字的字體、字重、大小等屬性。
    ```Swift
    func font(_ font: UIFont? = nil, name: String? = nil, size: CGFloat? = nil, weight: UIFont.Weight? = nil, italic: Bool? = nil, state: UIControl.State? = nil) -> Self
    ```
    ```Swift
    button.font(name: "Arial", size: 18, weight: .bold)
    ```
- `subTitleFont`
    > [!Note]
    > 功能： 設定按鈕子標題文字的字體、字重、大小等屬性。
    ```Swift
    func subTitleFont(_ subTitle: UIFont? = nil, name: String? = nil, size: CGFloat? = nil, weight: UIFont.Weight? = nil, italic: Bool? = nil, state: UIControl.State? = nil) -> Self
    ```
    ```Swift
    button.subTitleFont(name: "Helvetica", size: 12, italic: true)
    ```
- `image`
    > [!Note]
    > 功能： 設定按鈕圖片的大小、圓角、圖片位置等屬性。
    ```Swift
    func image(_ image: UIImage? = nil, size: CGSize? = nil, width: CGFloat? = nil, height: CGFloat? = nil, radius: CGFloat? = nil, radiusCorner: [UIRectCorner]? = nil, placement: NSDirectionalRectEdge? = nil, gap: CGFloat? = nil, state: UIControl.State? = nil) -> Self
    ```
    ```Swift
    button.image(UIImage(named: "icon"), size: CGSize(width: 24, height: 24), placement: .leading, gap: 8)
    ```
- `padding`
    > [!Note]
    > 功能： 設定按鈕的內邊距，支持統一或分方向設定。
    ```Swift
    func padding(_ value: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil, state: UIControl.State? = nil) -> Self
    ```
    ```Swift
    button.padding(top: 8, left: 12, bottom: 8, right: 12)
    button.padding(8)   // 四邊一致
    button.padding()    // 四邊一致 (預設 16)
    ```
- `if`
    > [!Note]
    > 功能： 根據條件執行指定操作。
    ```Swift
    func `if`(button bool: Bool, _ _self: (UIButton) throws -> Void) rethrows -> Self
    ```
    ```Swift
    button.if(自訂條件為真) { button in
        button.background(color: .green);
    };
    ```
- `action`
    > [!Note]
    > 功能： 為按鈕添加目標動作。
    ```Swift
    func action(for event: UIControl.Event, _ action: Selector) -> Self
    ```
    ```Swift
    button.action(for: .touchUpInside, #selector(Selector_Name))
    ```
- `action closure`
    > [!Note]
    > 功能： 使用閉包方式為按鈕添加動作。
    ```Swift
    func action(for event: UIControl.Event = .touchUpInside, _ closure: @escaping ExButtonActionClosure) -> Self
    ```
    ```Swift
    button.action(for: .touchUpInside) { button in
        print("已點擊");
    };
    ```

</details>

<details>
<summary>ExScrollView 擴展</summary>

## ExScrollView

> [!Note]
> 包含 **ExView** 所有方法

- `horizontal`
    > [!Note]
    > 功能： 設定滾動視圖為水平方向，並根據內容大小調整子視圖的寬度。
    ```Swift
    func horizontal(_ contentSize: CGSize) -> Self
    ```
    ```Swift
    scrollView.horizontal(CGSize(width: 1000, height: 200))
    ```
- `vertical`
    > [!Note]
    > 功能： 設定滾動視圖為垂直方向，並根據內容大小調整子視圖的高度。
    ```Swift
    func vertical(_ contentSize: CGSize) -> Self
    ```
    ```Swift
    scrollView.vertical(CGSize(width: 200, height: 1000))
    ```
- `padding`
    > [!Note]
    > 功能： 設定滾動視圖的內邊距，支持單方向或統一設置。
    ```Swift
    func padding(_ value: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> Self
    ```
    ```Swift
    scrollView.padding(top: 8, left: 12, bottom: 8, right: 12)
    scrollView.padding(8)   // 四邊一致
    scrollView.padding()    // 四邊一致 (預設 16)
    ```

</details>