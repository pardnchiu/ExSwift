import UIKit;

public struct ExStateImage {
	var state: UIControl.State? = nil;
	var image: UIImage? = nil;
	var size: CGSize? = nil;
	var width: CGFloat? = nil;
	var height: CGFloat? = nil;
	var radius: CGFloat? = nil;
	var radiusCorner: [UIRectCorner]? = nil;
	var placement: NSDirectionalRectEdge? = nil;
	var gap: CGFloat? = nil;

	public init(state: UIControl.State, image: UIImage? = nil, size: CGSize? = nil, width: CGFloat? = nil, height: CGFloat? = nil, radius: CGFloat? = nil, radiusCorner: [UIRectCorner]? = nil, placement: NSDirectionalRectEdge? = nil, gap: CGFloat? = nil) {
		self.state = state;
		self.image = image;
		self.size = size;
		self.width = width;
		self.height = height;
		self.radius = radius;
		self.radiusCorner = radiusCorner;
		self.placement = placement;
		self.gap = gap;
	};
};

@resultBuilder
public struct ExStateImageBuilder {
	public static func buildBlock(_ component: ExStateImage) -> [ExStateImage] {
		return [component]
	}

	// 處理多個組件的情況，不能移除
	public static func buildBlock(_ components: [ExStateImage]) -> [ExStateImage] {
		return components
	}

	// 處理多個視圖元件
	public static func buildBlock(_ components: [ExStateImage]...) -> [ExStateImage] {
		return components.flatMap { $0 }
	}

	// 處理表達式
	public static func buildExpression(_ expression: ExStateImage) -> [ExStateImage] {
		return [expression]
	}

	// 處理表達式
	public static func buildExpression(_ expression: Void) -> [ExStateImage] {
		return []
	}

	// 處理表達式
	public static func buildExpression(_ expression: () -> ExStateImage) -> [ExStateImage] {
		return [expression()]
	}

	public static func buildExpression(_ expression: [ExStateImage]) -> [ExStateImage] {
		return expression
	}

	// 處理單獨的 if 語句
	public static func buildIf(_ component: [ExStateImage]?) -> [ExStateImage] {
		return component ?? []
	}

	public static func buildEither(first component: [ExStateImage]) -> [ExStateImage] {
		return component
	}

	public static func buildEither(second component: [ExStateImage]) -> [ExStateImage] {
		return component
	}

	// 添加 buildArray 支援
	public static func buildArray(_ components: [[ExStateImage]]) -> [ExStateImage] {
		return components.flatMap { $0 }
	}
}

public func onNormal(image: UIImage? = nil, size: CGSize? = nil, width: CGFloat? = nil, height: CGFloat? = nil, radius: CGFloat? = nil, radiusCorner: [UIRectCorner]? = nil, placement: NSDirectionalRectEdge? = nil, gap: CGFloat? = nil) -> ExStateImage {
	return ExStateImage(state: .normal, image: image, size: size, width: width, height: height, radius: radius, radiusCorner: radiusCorner, placement: placement, gap: gap)
};

public func onHighLighted(image: UIImage? = nil, size: CGSize? = nil, width: CGFloat? = nil, height: CGFloat? = nil, radius: CGFloat? = nil, radiusCorner: [UIRectCorner]? = nil, placement: NSDirectionalRectEdge? = nil, gap: CGFloat? = nil) -> ExStateImage {
	return ExStateImage(state: .highlighted, image: image, size: size, width: width, height: height, radius: radius, radiusCorner: radiusCorner, placement: placement, gap: gap)
};

public func onDisabled(image: UIImage? = nil, size: CGSize? = nil, width: CGFloat? = nil, height: CGFloat? = nil, radius: CGFloat? = nil, radiusCorner: [UIRectCorner]? = nil, placement: NSDirectionalRectEdge? = nil, gap: CGFloat? = nil) -> ExStateImage {
	return ExStateImage(state: .disabled, image: image, size: size, width: width, height: height, radius: radius, radiusCorner: radiusCorner, placement: placement, gap: gap)
};

public func onSelected(image: UIImage? = nil, size: CGSize? = nil, width: CGFloat? = nil, height: CGFloat? = nil, radius: CGFloat? = nil, radiusCorner: [UIRectCorner]? = nil, placement: NSDirectionalRectEdge? = nil, gap: CGFloat? = nil) -> ExStateImage {
	return ExStateImage(state: .selected, image: image, size: size, width: width, height: height, radius: radius, radiusCorner: radiusCorner, placement: placement, gap: gap)
};

public func onFocused(image: UIImage? = nil, size: CGSize? = nil, width: CGFloat? = nil, height: CGFloat? = nil, radius: CGFloat? = nil, radiusCorner: [UIRectCorner]? = nil, placement: NSDirectionalRectEdge? = nil, gap: CGFloat? = nil) -> ExStateImage {
	return ExStateImage(state: .focused, image: image, size: size, width: width, height: height, radius: radius, radiusCorner: radiusCorner, placement: placement, gap: gap)
};
