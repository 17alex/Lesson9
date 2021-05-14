import UIKit

// AbstractFactory:

protocol Table {
    var name: String { get }
}

struct WoodTable: Table {
    var name: String = "Wood table"
}

struct MetalTable: Table {
    var name: String = "Metal table"
}

struct PlasticTable: Table {
    var name: String = "Plastic table"
}


protocol Chair {
    var name: String { get }
}

struct WoodChair: Chair {
    var name: String = "Wood chair"
}

struct MetalChair: Chair {
    var name: String = "Metal chair"
}

struct PlasticChair: Chair {
    var name: String = "Plastic chair"
}


protocol AbstractFactory {
    func createTable() -> Table
    func createChair() -> Chair
}

struct WoodFactory: AbstractFactory {
    
    func createTable() -> Table {
        print("create Wood Table")
        return WoodTable()
    }
    
    func createChair() -> Chair {
        print("create Wood Chair")
        return WoodChair()
    }
}

struct MetalFactory: AbstractFactory {
    
    func createTable() -> Table {
        print("create Metal Table")
        return MetalTable()
    }
    
    func createChair() -> Chair {
        print("create Metal Chair")
        return MetalChair()
    }
}

struct PlasticFactory: AbstractFactory {
    
    func createTable() -> Table {
        print("create Plastic Table")
        return PlasticTable()
    }
    
    func createChair() -> Chair {
        print("create Plastic Chair")
        return PlasticChair()
    }
}

var factory: AbstractFactory = WoodFactory()
factory.createChair()
factory.createTable()

factory = MetalFactory()
factory.createChair()
factory.createTable()

factory = PlasticFactory()
factory.createChair()
factory.createTable()

// --------------------------
//Bilder:

protocol Bilder {
    func setText()
    func setTextColor()
    func setFont()
    func getResult() -> UILabel
}

class TitleBilder: Bilder {
    
    var label = UILabel()
        
    func setText() {
        label.text = "Title"
    }
    
    func setTextColor() {
        label.textColor = .black
    }
    
    func setFont() {
        label.font = UIFont.systemFont(ofSize: 24)
    }
    
    func getResult() -> UILabel {
        return label
    }
}

class SubTitleBilder: Bilder {
    
    var label = UILabel()
    
    func setText() {
        label.text = "SubTitle"
    }
    
    func setTextColor() {
        label.textColor = .blue
    }
    
    func setFont() {
        label.font = UIFont.systemFont(ofSize: 20)
    }
    
    func getResult() -> UILabel {
        return label
    }
}

class RegularTextBilder: Bilder {
    
    var label = UILabel()
    
    func setText() {
        label.text = "RegularText"
    }
    
    func setTextColor() {
        label.textColor = .darkGray
    }
    
    func setFont() {
        label.font = UIFont.systemFont(ofSize: 16)
    }
    
    func getResult() -> UILabel {
        return label
    }
}

class HighLightTextBilder: Bilder {
    
    var label = UILabel()
    
    func setText() {
        label.text = "HighLightText"
    }
    
    func setTextColor() {
        label.textColor = .red
    }
    
    func setFont() {
        label.font = UIFont.systemFont(ofSize: 16)
    }
    
    func getResult() -> UILabel {
        return label
    }
}

class Director {
    
    var bilder: Bilder
    
    init(bilder: Bilder) {
        self.bilder = bilder
    }
    
    func setBilder(_ bilder: Bilder) {
        self.bilder = bilder
    }
    
    func createLabel() {
        bilder.setText()
        bilder.setTextColor()
        bilder.setFont()
    }
}

var bilder: Bilder = TitleBilder()
let director = Director(bilder: bilder)
director.createLabel()
var label = bilder.getResult()
print(label.text!)

bilder = SubTitleBilder()
director.setBilder(bilder)
director.createLabel()
label = bilder.getResult()
print(label.text!)

bilder = RegularTextBilder()
director.setBilder(bilder)
director.createLabel()
label = bilder.getResult()
print(label.text!)

bilder = HighLightTextBilder()
director.setBilder(bilder)
director.createLabel()
label = bilder.getResult()
print(label.text!)
