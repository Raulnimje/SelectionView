import UIKit

class ButtonView: UIView {
    
    private let container = UIStackView(forAutoLayout: ())
    private let titleLabel = UILabel(forAutoLayout: ())
    private let iconImageView = UIImageView(forAutoLayout: ())
    private let topButton = UIButton(forAutoLayout: ())
    private var animationDuration: TimeInterval = 0.01
    
    typealias TapEventHandler = () -> Void
    var onTouch: TapEventHandler?
    
    var viewModel: ButtonViewModel? {
        didSet {
            if let model = viewModel {
                fillData(model: model, duration: animationDuration)
                animationDuration = 0.15
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
    }
}

private extension ButtonView {
    func setupView() {
        addSubview(container)
        
        container.autoAlignAxis(toSuperviewAxis: .horizontal)
        container.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        container.autoPinEdge(toSuperviewEdge: .trailing, withInset: 5)
        
        container.axis = .vertical
        container.alignment = .center
        container.spacing = 8
        
        // Icon image view
        container.addArrangedSubview(iconImageView)
        
        iconImageView.autoMatch(.width, to: .width, of: container, withMultiplier: 0.5)
        iconImageView.autoMatch(.height, to: .width, of: container, withMultiplier: 0.5)
        
        // title label
        container.addArrangedSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        
        // button
        addSubview(topButton)
        topButton.autoPinEdgesToSuperviewEdges()
        topButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: Any) {
        onTouch?()
    }
    
    func fillData(model: ButtonViewModel, duration: TimeInterval) {
        titleLabel.text = model.title
        
        if model.isSelected {
            animate(shrink: true, duration: duration)
            backgroundColor = model.selectedColor
            titleLabel.textColor = model.unselectedColor
            iconImageView.image = model.image.tintedImage(imageColor: model.unselectedColor)
        } else {
            animate(shrink: false, duration: duration)
            backgroundColor = model.unselectedColor
            titleLabel.textColor = model.selectedColor
            iconImageView.image = model.image.tintedImage(imageColor: model.selectedColor)
        }
    }
    
    func animate(shrink: Bool, duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn, animations: {
            if shrink {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            } else {
                self.transform = .identity
            }
        }, completion: nil)
    }
}
