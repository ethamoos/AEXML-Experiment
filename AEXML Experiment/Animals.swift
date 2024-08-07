//
//  Animals.swift
//  AEXML Experiment
//
//  Created by Amos Deane on 17/07/2024.
//

import Foundation



import SwiftUI
import AEXML
import AppKit


// Class based on examples and tests

@MainActor class Animals: ObservableObject {
    
    @Published var animalsCount: Int = 0
    @Published var dogs: [AEXMLElement] = []
    @Published var dogsNames: [String] = []
    @Published var newdogs: [AEXMLElement] = []
    @Published var dogsDict = [String: String]()
    @Published var xmlDoc: AEXMLDocument = AEXMLDocument()
    //    @Published var updatedXmlDoc: AEXMLDocument = AEXMLDocument()
    //    @Published var updatedXmlDocString: String = ""
    
    // MARK: - Properties
    
    var exampleDocument = AEXMLDocument()
    var plantsDocument = AEXMLDocument()
    
    
    
    //    ##################################################
    //    GENERIC FUNCTIONS
    //    ##################################################
    
    
    func readXMLDataFromString(xmlContent: String) {
        
        self.separationLine()
        print("Running readXMLDataFromString")
        //        print("xmlContent as String is:\(xmlContent)")
        
        guard let data = try? Data(xmlContent.utf8)
                
        else {
            print("Sample XML Data error.")
            return
        }
        
        do {
            xmlDoc = try AEXMLDocument(xml: data)
            //            print("XML doc is:")
            //            print(xmlDoc.xml)
            
        }
        catch {
            print("\(error)")
        }
    }
    
    //    func updateXMLData(updatedContent: AEXMLDocument) {
    //
    //        self.separationLine()
    //        print("Running updateXMLData")
    //        print("xmlContent is:\(updatedContent.root)")
    //        do {
    //            updatedXmlDoc = try AEXMLDocument(root: updatedContent)
    //        }
    //        catch {
    //            print("\(error)")
    //        }
    //
    //        print("Updating master")
    //        xmlDoc = updatedXmlDoc
    //        print(xmlDoc.xml)
    //
    //    }
    
    //    func readUpdatedData(updatedContent: AEXMLDocument) {
    //
    //        self.separationLine()
    //        print("Running updateXMLData")
    //        print("xmlContentUpdated is:\(updatedContent.root.string)")
    //        do {
    //            updatedXmlDoc = try AEXMLDocument(root: updatedContent)
    //        }
    //        catch {
    //            print("\(error)")
    //        }
    //        print("updatedXmlDoc is:\(updatedXmlDoc.root.string)")
    //        print(updatedXmlDoc.xml)
    //
    //
    //
    //    }
    
    
    
    func separationLine() {
        print("------------------------------------------------------------------")
    }
    
    
    // prints 4
    func getDocChildren(xmlContent: String) {
        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("Getting doc children")
        for child in xmlDoc.root.children {
            print(child.name)
        }
    }
    
    func getDocChildrenData(xmlContent: AEXMLDocument) {
        
        //        readUpdatedData(updatedContent: xmlContent)
        //        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("Getting doc children")
        for child in xmlDoc.root.children {
            //            print("Child is:")
            print(child.name)
        }
    }
    
    
    func getDocChildrenDogsData(xmlContent: AEXMLDocument) {
        
        //        readUpdatedData(updatedContent: xmlContent)
        //        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("Getting doc children")
        
        for child in xmlDoc.root.children {
            print("Child is:")
            print(child.name)
        }
    }
    
    //    func getFirstElement() {
    //        self.separationLine()
    //        print("Getting first element")
    //        readXMLDataFromString(xmlContent: xmlContent)
    //        print(xmlDoc.root["cats"]["cat"].value)
    //    }
    
    
    func getLastElement(xmlContent: String) {
        self.separationLine()
        print("Getting last element")
        print(xmlDoc.root["dogs"]["dog"].last?.value)
    }
    
    func getDogByPosition(position: Int,xmlContent: String) {
        self.separationLine()
        print("Getting first element")
        readXMLDataFromString(xmlContent: xmlContent)
        print(xmlDoc.root["dogs"].children[position].string)
    }
    
    func countCats() {
        print(xmlDoc.root["cats"]["cat"].count)
    }
    
    func getCatsByBreed() {
        print(xmlDoc.root["cats"]["cat"].attributes["breed"]!)
    }
    
    func getCatsCompact() {
        print(xmlDoc.root["cats"]["cat"].xmlCompact)
    }
    
    func printDoc(xmlContent: String) {
        print(xmlDoc.root["cats, dogs"])
        print(xmlDoc.root[""])
        
    }
    
    //
    
    //    ##################################################
    //    GET DATA SPECIFIC TO THIS APP
    //    ##################################################
    
    
    //    func getAllCats(xmlContent: String) {
    //        self.separationLine()
    //        print("Getting first element")
    //        readXMLDataFromString(xmlContent: xmlContent)
    //        print("Getting all cats!")
    //        if let cats = xmlDoc.root["cats"]["cat"].all {
    //            for cat in cats {
    //                if let name = cat.value {
    //                    print(name)
    //                }
    //            }
    //        }
    //    }
    
    func getAllDogs(xmlContent: String) {
        
        self.separationLine()
        print("Getting first element")
        readXMLDataFromString(xmlContent: xmlContent)
        print("Getting all dogs!")
        
        if let dogs = xmlDoc.root["dogs"]["dog"].all {
            for dog in dogs {
                if let name = dog.value {
                    print(name)
                    dogsDict[name] = name
                    dogsNames.insert(name, at: 0)
                    
                }
            }
        }
    }
    
    
    func updateGetAllDogs(xmlContent: String) {
        self.separationLine()
        print("Getting first element")
        readXMLDataFromString(xmlContent: xmlContent)
        print("Getting all dogs!")
        
        if let dogs = xmlDoc.root["dogs"]["dog"].all {
            for dog in dogs {
                if let name = dog.value {
                    print("Dog has a name:\(name)")
                    
                    if let name = dogsDict[name]  {
                        print("Dog already in list")
                    } else {
                        print("Dog\(name) not found in list - adding")
                        dogsNames.insert(name, at: 0)
                        
                    }
                    
                }
            }
        }
    }
    
    
    //    ##################################################
    
    //    ##################################################
    
    
    
    //    func getAllDogsData(xmlContent: AEXMLDocument) {
    //        self.separationLine()
    //        print("Getting first element")
    ////        readUpdatedData(updatedContent: xmlContent)
    //        print("Getting all dogs!")
    //        if let dogs = xmlDoc.root["dogs"]["dog"].all {
    //            for dog in dogs {
    //                if let name = dog.value {
    //                    print(name)
    //                }
    //            }
    //        }
    //    }
    
    func printDogsByColor(color: String) {
        // prints Villy, Spot
        for dog in xmlDoc.root["dogs"]["dog"].all! {
            if let color = dog.attributes["color"] {
                if color == "white" {
                    print(dog.string)
                }
            }
        }
    }
    
    func printCatsCalled(name: String) {
        // prints Tinna
        if let cats = xmlDoc.root["cats"]["cat"].all(withValue: name) {
            for cat in cats {
                print(cat.string)
            }
        }
    }
    
    func printCatsByBreedColor(name: String, breed: String, color: String) {
        
        // prints Caesar
        if let cats = xmlDoc.root["cats"]["cat"].all(withAttributes: ["breed" : breed, "color" : color]) {
            for cat in cats {
                print(cat.string)
            }
        }
    }
    
    //    func addCat(name: String, color: String, breed: String, xmlContent: String) {
    //        readXMLDataFromString(xmlContent: xmlContent)
    //
    //        let cats = xmlDoc.root["cats"]
    //        let newCat = cats.addChild(name: name)
    //        //        print("Cats are:")
    //        //        print(cats)
    //        getAllCats(xmlContent: xmlContent)
    //    }
    
    //    ##################################################
    //    ##################################################
    
    func addDog(name: String, color: String, breed: String, xmlContent: String) {
        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("addDog to data")
        let dogs = xmlDoc.root["dogs"]
        let root = xmlDoc.root
        //        print("xmlDoc.root is:\(root)")
        //        print(String(describing: root).utf8)
        
        let attributes = "dog breed=\"\(breed)\" color=\"\(color)\""
        let newDogs = dogs.addChild(name: attributes, value: name)
        self.separationLine()
        print("attributes are:\(attributes)")
        print("name is:\(name)")
        print("breed is:\(breed)")
        self.separationLine()
        print("Read main XML doc")
        print(xmlDoc.xml)
        
    }
    
    
    
    //    ##################################################
    //          addChild
    //    ##################################################
    
    
    func addChild(xmlContent: String) {
        
        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("addDog to data")
        
        let ducks = xmlDoc.root.addChild(name: "ducks")
        ducks.addChild(name: "duck", value: "Donald")
        ducks.addChild(name: "duck", value: "Daisy")
        ducks.addChild(name: "duck", value: "Scrooge")
        
        print("updatedContent is:\(xmlDoc.root.string)")
        
        let animalsCount = xmlDoc.root.children.count
        
    }
    
    
    //    ##################################################
    
    //    ##################################################
    
    func addChildWithAttributes(xmlContent: String) {
        
        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("addDog to data")
        
        let cats = xmlDoc.root["cats"]
        let dogs = xmlDoc.root["dogs"]
        
        cats.addChild(name: "cat", value: "Garfield", attributes: ["breed" : "tabby", "color" : "orange"])
        dogs.addChild(name: "dog", value: "Snoopy", attributes: ["breed" : "beagle", "color" : "white"])
        
        let catsCount = cats["cat"].count
        let dogsCount = dogs["dog"].count
        
        let lastCat = cats["cat"].last!
        let penultDog = dogs.children[3]
        
        //            XCTAssertEqual(catsCount, 5, "Should be able to add child element with attributes to an element.")
        //            XCTAssertEqual(dogsCount, 5, "Should be able to add child element with attributes to an element.")
        //
        //            XCTAssertEqual(lastCat.attributes["color"], "orange", "Should be able to get attribute value from added element.")
        //            XCTAssertEqual(penultDog.string, "Kika", "Should be able to add child with attributes without overwrites existing elements. (Github Issue #28)")
    }
    
    func addChildWithAttributesGeneric(node: String, childName: String, name: String, color: String, breed: String,xmlContent: String) {
        
        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("addDog to data")
        
        let node = xmlDoc.root[node]
        
        node.addChild(name: childName, value: name, attributes: ["breed" : breed, "color" : color])
        
        //        let catsCount = cats["cat"].count
        //        let dogsCount = dogs["dog"].count
        //
        //        let lastCat = cats["cat"].last!
        //        let penultDog = dogs.children[3]
        
        //            XCTAssertEqual(catsCount, 5, "Should be able to add child element with attributes to an element.")
        //            XCTAssertEqual(dogsCount, 5, "Should be able to add child element with attributes to an element.")
        //
        //            XCTAssertEqual(lastCat.attributes["color"], "orange", "Should be able to get attribute value from added element.")
        //            XCTAssertEqual(penultDog.string, "Kika", "Should be able to add child with attributes without overwrites existing elements. (Github Issue #28)")
    }
    
    
    
    //    ##################################################
    //    addAnimalChildren
    //    ##################################################
    
    func addAnimalChildren(xmlContent: String) {
        
        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("Running addChildren")
        
        let animals: [AEXMLElement] = [
            AEXMLElement(name: "dinosaurs"),
            AEXMLElement(name: "birds"),
            AEXMLElement(name: "bugs"),
        ]
        
        
        print("Add new child nodes")
        
        xmlDoc.root.addChildren(animals)
        
        animalsCount = xmlDoc.root.children.count
        
        //        getDocChildrenData(xmlContent: updatedXmlDoc)
        
        //            XCTAssertEqual(animalsCount, 5, "Should be able to add children elements to an element.")
    }
    
    //    ##################################################
    //    addAnimalDogChildren
    //    ##################################################
    
    
    func addAnimalDogChildren(xmlContent: String) {
        
        readXMLDataFromString(xmlContent: xmlContent)
        self.separationLine()
        print("Running addAnimalDogChildren")
        
        //        let dogs: [AEXMLElement] = [
        //            AEXMLElement(name: "dinosaurs"),
        //            AEXMLElement(name: "birds"),
        //            AEXMLElement(name: "bugs"),
        //        ]
        
        for dog in dogs {
            print(dog.string)
            //            dogsDict["Name"] = dog.string
            newdogs[0] = dog
        }
        
        print("Add new child nodes")
        xmlDoc.root.addChildren(newdogs)
        //        updatedXmlDoc = xmlDoc
        //        updatedXmlDocString = updatedXmlDoc.root.string
        //        updatedXmlDocString = updatedXmlDoc.root.string
        
        let animalsCount = xmlDoc.root.children.count
        
        print("Printing dogs again")
        for dog in newdogs {
            print(dog.string)
            print(dogs[2])
            print(dogs[3])
        }
        
        let dogsCount = xmlDoc.root["dogs"]["dog"].all?.count
        
        getDocChildrenData(xmlContent: xmlDoc)
        //            XCTAssertEqual(animalsCount, 5, "Should be able to add children elements to an element.")
    }
    
    
    func addAttributes() {
        
        let firstCat = xmlDoc.root["cats"]["cat"]
        
        firstCat.attributes["funny"] = "true"
        firstCat.attributes["speed"] = "fast"
        firstCat.attributes["years"] = "7"
        
        //            XCTAssertEqual(firstCat.attributes.count, 5, "Should be able to add attributes to an element.")
        //            XCTAssertEqual(Int(firstCat.attributes["years"]!), 7, "Should be able to get any attribute value now.")
    }
    
    func removeChild() {
        let cats = xmlDoc.root["cats"]
        let lastCat = cats["cat"].last!
        let duplicateCat = cats.addChild(name: "cat", value: "Tinna", attributes: ["breed" : "Siberian", "color" : "lightgray"])
        
        lastCat.removeFromParent()
        duplicateCat.removeFromParent()
        
        let catsCount = cats["cat"].count
        let firstCat = cats["cat"]
        //            XCTAssertEqual(catsCount, 3, "Should be able to remove element from parent.")
        //            XCTAssertEqual(firstCat.string, "Tinna", "Should be able to remove the exact element from parent.")
    }
    
}



    // MARK: - Helpers
    
////       func URLForResource(fileName: String, withExtension ext: String) -> URL {
////           if let url = Bundle(for: AEXMLTests.self)
////               .url(forResource: fileName, withExtension: ext) {
////               return url
////           } else {
////               guard let url = Bundle.module
////                       .url(forResource: "Resources/\(fileName)", withExtension: ext) else {
////                   fatalError("can't find resource named: '\(fileName)'")
////               }
////               return url
////           }
////       }
//
//       func xmlDocumentFromURL(url: URL) -> AEXMLDocument {
//           var xmlDocument = AEXMLDocument()
//
//           do {
//               let data = try Data.init(contentsOf: url)
//               xmlDocument = try AEXMLDocument(xml: data)
//           } catch {
//               print(error)
//           }
//
//           return xmlDocument
//       }
//
//       func readXMLFromFile(filename: String) -> AEXMLDocument {
//           let url = URLForResource(fileName: filename, withExtension: "xml")
//           return xmlDocumentFromURL(url: url)
//       }
//
//       // MARK: - Setup & Teardown
//
//       override func setUp() {
//           super.setUp()
//
//           // create some sample xml documents
//           exampleDocument = readXMLFromFile(filename: "example")
//           plantsDocument = readXMLFromFile(filename: "plant_catalog")
//       }
//
//       override func tearDown() {
//           // reset sample xml document
//           exampleDocument = AEXMLDocument()
//           plantsDocument = AEXMLDocument()
//
//           super.tearDown()
//       }
//
//       // MARK: - XML Document
//
//       func testXMLDocumentManualDataLoading() {
//           do {
//               let url = URLForResource(fileName: "example", withExtension: "xml")
//               let data = try Data.init(contentsOf: url)
//
//               let testDocument = AEXMLDocument()
//               try testDocument.loadXML(data)
//               XCTAssertEqual(testDocument.root.name, "animals", "Should be able to find root element.")
//           } catch {
//               XCTFail("Should be able to load XML Document with given Data.")
//           }
//       }
//
//       func testXMLDocumentInitFromString() {
//           do {
//               let testDocument = try AEXMLDocument(xml: exampleDocument.xml)
//               XCTAssertEqual(testDocument.xml, exampleDocument.xml)
//           } catch {
//               XCTFail("Should be able to initialize XML Document from XML String.")
//           }
//       }
//
//       func testXMLOptions() {
//           do {
//               var options = AEXMLOptions()
//               options.documentHeader.version = 2.0
//               options.documentHeader.encoding = "utf-16"
//               options.documentHeader.standalone = "yes"
//
//               let testDocument = try AEXMLDocument(xml: "<foo><bar>hello</bar></foo>", options: options)
//               XCTAssertEqual(testDocument.xml, "<?xml version=\"2.0\" encoding=\"utf-16\" standalone=\"yes\"?>\n<foo>\n\t<bar>hello</bar>\n</foo>")
//               XCTAssertEqual(testDocument.root["bar"].first?.string, "hello")
//           } catch {
//               XCTFail("Should be able to initialize XML Document with custom AEXMLOptions.")
//           }
//       }
//
//       func testXMLParser() {
//           do {
//               let testDocument = AEXMLDocument()
//               let url = URLForResource(fileName: "example", withExtension: "xml")
//               let data = try Data.init(contentsOf: url)
//
//               let parser = AEXMLParser(document: testDocument, data: data)
//               try parser.parse()
//
//               XCTAssertEqual(testDocument.root.name, "animals", "Should be able to find root element.")
//           } catch {
//               XCTFail("Should be able to parse XML Data into XML Document without throwing error.")
//           }
//       }
//
//       func testXMLParserTrimsWhitespace() {
//           let result = whitespaceResult(shouldTrimWhitespace: true)
//           XCTAssertEqual(result, "Hello,")
//       }
//
//       func testXMLParserWithoutTrimmingWhitespace(){
//           let result = whitespaceResult(shouldTrimWhitespace: false)
//           XCTAssertEqual(result, "Hello, ")
//       }
//
//       private func whitespaceResult(shouldTrimWhitespace: Bool) -> String?{
//           do {
//               var options = AEXMLOptions()
//               options.parserSettings.shouldTrimWhitespace = shouldTrimWhitespace
//
//               let testDocument = AEXMLDocument(options: options)
//               let url = URLForResource(fileName: "whitespace_examples", withExtension: "xml")
//               let data = try Data.init(contentsOf: url)
//
//               let parser = AEXMLParser(document: testDocument, data: data)
//               try parser.parse()
//
//               return testDocument.root["text"].first?.string
//           } catch {
//               XCTFail("Should be able to parse XML without throwing an error")
//           }
//           return nil
//       }
//
//       func testXMLParserError() {
//           do {
//               let testDocument = AEXMLDocument()
//               let testData = Data()
//               let parser = AEXMLParser(document: testDocument, data: testData)
//               try parser.parse()
//           } catch {
//               XCTAssertEqual(error.localizedDescription, AEXMLError.parsingFailed.localizedDescription)
//           }
//       }
//
//       // MARK: - XML Read
//
//       func testRootElement() {
//           XCTAssertEqual(exampleDocument.root.name, "animals", "Should be able to find root element.")
//
//           let documentWithoutRootElement = AEXMLDocument()
//           let rootElement = documentWithoutRootElement.root
//           XCTAssertEqual(rootElement.error, AEXMLError.rootElementMissing, "Should have RootElementMissing error.")
//       }
//
//       func testParentElement() {
//           XCTAssertEqual(exampleDocument.root["cats"].parent!.name, "animals", "Should be able to find parent element.")
//       }
//
//       func testChildrenElements() {
//           var count = 0
//           for _ in exampleDocument.root["cats"].children {
//               count += 1
//           }
//           XCTAssertEqual(count, 4, "Should be able to iterate children elements")
//       }
//
//       func testName() {
//           let secondChildElementName = exampleDocument.root.children[1].name
//           XCTAssertEqual(secondChildElementName, "dogs", "Should be able to return element name.")
//       }
//
//       func testAttributes() {
//           let firstCatAttributes = exampleDocument.root["cats"]["cat"].attributes
//
//           // iterate attributes
//           var count = 0
//           for _ in firstCatAttributes {
//               count += 1
//           }
//           XCTAssertEqual(count, 2, "Should be able to iterate element attributes.")
//
//           // get attribute value
//           if let firstCatBreed = firstCatAttributes["breed"] {
//               XCTAssertEqual(firstCatBreed, "Siberian", "Should be able to return attribute value.")
//           } else {
//               XCTFail("The first cat should have breed attribute.")
//           }
//       }
//
//       func testValue() {
//           let firstPlant = plantsDocument.root["PLANT"]
//
//           let firstPlantCommon = firstPlant["COMMON"].value!
//           XCTAssertEqual(firstPlantCommon, "Bloodroot", "Should be able to return element value as optional string.")
//
//           let firstPlantElementWithoutValue = firstPlant["ELEMENTWITHOUTVALUE"].value
//           XCTAssertNil(firstPlantElementWithoutValue, "Should be able to have nil value.")
//
//           let firstPlantEmptyElement = firstPlant["EMPTYELEMENT"].value
//           XCTAssertNil(firstPlantEmptyElement, "Should be able to have nil value.")
//       }
//
//       func testStringValue() {
//           let firstPlant = plantsDocument.root["PLANT"]
//
//           let firstPlantCommon = firstPlant["COMMON"].string
//           XCTAssertEqual(firstPlantCommon, "Bloodroot", "Should be able to return element value as string.")
//
//           let firstPlantElementWithoutValue = firstPlant["ELEMENTWITHOUTVALUE"].string
//           XCTAssertEqual(firstPlantElementWithoutValue, "", "Should be able to return empty string if element has no value.")
//
//           let firstPlantEmptyElement = firstPlant["EMPTYELEMENT"].string
//           XCTAssertEqual(firstPlantEmptyElement, String(), "Should be able to return empty string if element has no value.")
//       }
//
//       func testBoolValue() {
//           let firstTrueString = plantsDocument.root["PLANT"]["TRUESTRING"].bool
//           XCTAssertEqual(firstTrueString, true, "Should be able to cast element value as Bool.")
//
//           let firstFalseString = plantsDocument.root["PLANT"]["FALSESTRING"].bool
//           XCTAssertEqual(firstFalseString, false, "Should be able to cast element value as Bool.")
//
//           let firstTrueString2 = plantsDocument.root["PLANT"]["TRUESTRING2"].bool
//           XCTAssertEqual(firstTrueString2, true, "Should be able to cast element value as Bool.")
//
//           let firstFalseString2 = plantsDocument.root["PLANT"]["FALSESTRING2"].bool
//           XCTAssertEqual(firstFalseString2, false, "Should be able to cast element value as Bool.")
//
//           let firstTrueInt = plantsDocument.root["PLANT"]["TRUEINT"].bool
//           XCTAssertEqual(firstTrueInt, true, "Should be able to cast element value as Bool.")
//
//           let firstFalseInt = plantsDocument.root["PLANT"]["FALSEINT"].bool
//           XCTAssertEqual(firstFalseInt, false, "Should be able to cast element value as Bool.")
//
//           let firstElementWithoutValue = plantsDocument.root["ELEMENTWITHOUTVALUE"].bool
//           XCTAssertNil(firstElementWithoutValue, "Should be able to return nil if value can't be represented as Bool.")
//       }
//
//       func testIntValue() {
//           let firstPlantZone = plantsDocument.root["PLANT"]["ZONE"].int
//           XCTAssertEqual(firstPlantZone, 4, "Should be able to cast element value as Integer.")
//
//           let firstPlantPrice = plantsDocument.root["PLANT"]["PRICE"].int
//           XCTAssertNil(firstPlantPrice, "Should be able to return nil if value can't be represented as Integer.")
//       }
//
//       func testDoubleValue() {
//           let firstPlantPrice = plantsDocument.root["PLANT"]["PRICE"].double
//           XCTAssertEqual(firstPlantPrice, 2.44, "Should be able to cast element value as Double.")
//
//           let firstPlantBotanical = plantsDocument.root["PLANT"]["BOTANICAL"].double
//           XCTAssertNil(firstPlantBotanical, "Should be able to return nil if value can't be represented as Double.")
//       }
 
    
