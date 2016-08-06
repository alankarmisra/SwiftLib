#Classes

##ViewWithGradientBackground : UIView
An extremely simplistic UIView subclass to allow for a gradient background. It exposes the following method:
```swift
func setGradientBackgroundWithColors(colors:[AnyObject])
```
where colors need to be <code>CGColor</code> objects. 

To further customize the gradient, use the property:

```swift
var gradientBackground:CAGradientLayer?
```
Setting this property to <code>nil</code> removes the gradient background.

###Usage example
```swift
class ViewController : UIViewController {
  @IBOutlet var mView: ViewWithGradientBackground! // Link this to your ViewController's view
  
  override func viewDidLoad() { 
    superViewDidLoad()
    // ...
    mView.setGradientBackgroundWithColors([UIColor.redColor().CGColor, UIColor.greenColor().CGColor])
    // Optionally customize the gradient
    let glayer = mView.gradientBackground // Returns a CAGradientLayer
    // Customize the gradient here ...
  }
}
```

The class overrides <code>layoutSubviews</code> so when the view is rotated, the gradient is redrawn.
