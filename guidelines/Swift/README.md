#  Swift Guidelines


## 1. Namespace

### 1.1 Class names
All the classes should use PascalCase, not camelCase

```swift
// Not Preferred
class viewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
```

```swift
// Preferred
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
```

### 1.2 Method names
All the methods should use camelCase

```swift
// Not Preferred
protocol Service {
    func GetProducts()
}
```

```swift
// Preferred
protocol Service {
    func getProducts()
}
```

Never repeat a name on the first parameter when it's in the final of a method name

```swift
// Not Preferred
protocol ViewModel {
    func getProducts(products: [Products])
}
```

```swift
// Preferred
protocol ViewModel {
    func get(products: [Products])
}
```

Add parameter labels to make methods more readable

```swift
// Not Preferred
protocol ViewModel {
    func getTypeFromProduct(product: Product)
}
```

```swift
// Preferred
protocol ViewModel {
    func getType(from product: Product)
}
```

### 1.3 Variable names
All the variables should use camelCase

```swift
// Not Preferred
struct Product {
    let Name: String
}
```

```swift
// Preferred
struct Product {
    let name: String
}
```

Always put the type as sufix of a variable, except for the swift types(Int, String, Double...)

```swift
// Not Preferred
class ViewController {
    let nameString: String
    let username: TextField
}
```

```swift
// Preferred
class ViewController {
    let name: String
    let usernameTextField: TextField
}
```

### 1.4 Acronyms
Always define acronyms with all letters uppercased

```swift
// Not Preferred
class ViewController: TlViewController {
    let nameString: String
}
```

```swift
// Preferred
class ViewController: TLViewController {
    let nameString: String
}
```

## 2. Spacing

### 2.1 Line spaces
Never put an empty line between braces {}, except for classes

```swift
// Not Preferred
struct Products {

    let name: String
    
}

protocol ViewModel {

    func getProducts()
    
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
```

```swift
// Preferred
struct Products {
    let name: String
}

protocol ViewModel {
    func getProducts()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
```

Always put a line between methods, except in protocol definitions
```swift
// Not Preferred
protocol ViewModel {
    func getProducts()
    
    func getUsers()
}

class ViewModelImpl: ViewModel {

    func getProducts() {
    // ...
    }
    func getUsers() {
    // ...
    }
    
}
```

```swift
// Preferred
protocol ViewModel {
    func getProducts()
    func getUsers()
}

class ViewModelImpl: ViewModel {

    init() {}

    func getProducts() {
    // ...
    }
    
    func getUsers() {
    // ...
    }
    
}
```

### 2.2 Line break
Always break lines after defining new scope, except for single lines in methods, ifs, guards and switch cases

```swift
// Not Preferred
protocol ViewModel { func getProducts(name: String?) }

class ViewModelImpl: ViewModel { init() {}

    func getProducts(name: String?) {
        guard let name = name else { 
            return         
        }
        
        if name == nil { 
            return
        }
        
        switch name {
        case "Red Shirt": 
            print("Red!") 
        }
    }

}
```

```swift
// Preferred
protocol ViewModel {
    func getProducts(name: String?)
}

class ViewModelImpl: ViewModel {

    func getProducts(name: String?) {
        guard let name = name else { return }
        
        if name == nil { return }
        
        switch name {
        case "Red Shirt": print("Red!") 
        }
    }

}
```

### 2.3 Spaces
Always put one space before open brackets

```swift
// Not Preferred
protocol ViewModel{
    func getProducts(name: String?)
}
```

```swift
// Preferred
protocol ViewModel {
    func getProducts(name: String?)
}
```

Never put spaces before double pointers, always put one space after double pointers, except for ternary ifs

```swift
// Not Preferred
class ViewController :UIViewController {
    func getProducts(name : String?) {}
}
```

```swift
// Preferred
class ViewController: UIViewController {
    func getProducts(name: String?) {}
}
```

Never put spaces before open squares and parentheses

```swift
// Not Preferred
class ViewController: UIViewController {

    var products = [Products]()
    
    func getProducts (index: Int) -> Product {
        return products [index]
    }
    
}
```

```swift
// Preferred
class ViewController: UIViewController {

    var products = [Products]()
    
    func getProducts(index: Int) -> Product {
        return products[index]
    }
    
}
```

Always put one space before and after equals(=)

```swift
// Not Preferred
class ViewController: UIViewController {

    var products=[Products]()
    
}
```

```swift
// Preferred
class ViewController: UIViewController {

    var products = [Products]()
    
}
```

### 2.4 Tabs
Always use 1 tab for identation, never spaces

```swift
// Not Preferred
protocol ViewModel{
 func getProducts(name: String?)
}
```

```swift
// Preferred
protocol ViewModel {
    func getProducts(name: String?)
}
```

## 3. Optionals

### 3.1 Force unwraps
Never force unwrap variables

```swift
// Not Preferred
func print(color: String?) {
    print(color!)
}
```

```swift
// Preferred
func print(color: String?) {
    guard let color = color else { return }
    print(color)
}

func print(color: String?) {
    if let color = color {
        print(color)
    }
}

func print(color: String?) {
    print(color ?? "No color!")
}
```

### 3.2 Force casts
Never force cast variables

```swift
// Not Preferred
func print(age: Int?) {
    print(age as! Double)
}
```

```swift
// Preferred
func print(age: Int?) {
    guard let age = age as? Double else { return }
    print(age)
}

func print(age: Int?) {
    if let age = age as? Double {
        print(age as! Double)
    }
}

func print(age: Int?) {
    print(age as? Double ?? 0)
}
```

## 4. Avoid Retain Cycles

### 4.1 In dependencys

```swift
// Not Preferred
class ViewController {
    var viewModel: ViewModel
}

class ViewModel {
    var viewController: ViewController?
}
```

```swift
// Preferred
class ViewController {
    var viewModel: ViewModel
}

class ViewModel {
    weak var viewController: ViewController?
}
```

### 4.2 In closures

```swift
// Not Preferred
func getProducts() {
    service.getProducts { products in
        // ...
    }
}
```

```swift
// Preferred
func getProducts() {
    service.getProducts { [weak self] products in
        guard let self = self else { return } // if needed
        // ...
    }
}
```
