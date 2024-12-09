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