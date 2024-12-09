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