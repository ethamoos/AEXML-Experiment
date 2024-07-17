//
//  ContentView.swift
//  AEXML Experiment
//
//  Created by Amos Deane on 23/02/2024.
//
//

import SwiftUI
import AEXML
import AppKit

let columns = [
       
       GridItem(.adaptive(minimum: 100)),
       GridItem(.adaptive(minimum: 100)),
       GridItem(.adaptive(minimum: 100)),

   ]


let xmlStringAnimals: String = """
<?xml version="1.0" encoding="utf-8"?>
<animals>
    <cats>
        <cat breed="Siberian" color="lightgray">Tinna</cat>
        <cat breed="Domestic" color="darkgray">Rose</cat>
        <cat breed="Domestic" color="yellow">Caesar</cat>
    </cats>
    <dogs>
        <dog breed="Bull Terrier" color="white">Villy</dog>
        <dog breed="Sausage" color="white">Spot</dog>
        <dog breed="Golden Retriever" color="yellow">Betty</dog>
        <dog breed="Miniature Schnauzer" color="black">Kika</dog>
    </dogs>
</animals>
"""

struct ContentView: View {
    
    @EnvironmentObject var animals: Animals
    
    @State var newAnimalName: String = ""
    @State var newAnimalColour: String = ""
    @State var newAnimalBreed: String = ""
    @State var newNodeName: String = ""
    @State var newChildName: String = ""
    @State var selection = String("")
    @State var xmlString = ""
    
    
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
            Text("Current Dogs:") .font(.system(size: 18, weight: .medium))

            Divider()
            Section(header: Text("Dog Names").bold()) {
                
                ForEach(animals.dogsNames, id: \.self) {name in
                    Text(name)
                }
            }
            Spacer()
            
            Button(action: {
                
                print("getAllDogs button was tapped")
                animals.getAllDogs(xmlContent: animals.xmlDoc.string)
                
            }) {
                HStack {
                    Image(systemName: "dog.fill")
                    Text("List Dogs")
                }
            }
            Divider()
            
        
            Text("XML Data is:")
            
            Capsule()
                 .fill(Color.blue)
                 .overlay(
            Text(String(describing: animals.xmlDoc.xml))
                 )

            Text("AnimalsCount is:\(animals.animalsCount)")

            
            //    #################################################################################
            //    updateGroup
            //    #################################################################################
            
            
//            Button(action: {
//                print("updateGetAllDogs button was tapped")
//                
//                xmlString = animals.xmlDoc.xml
//                
//                animals.updateGetAllDogs(xmlContent: xmlString)
//            }) {
//                HStack(spacing: 10) {
//                    Image(systemName: "pencil")
//                    Text("Update Dogs")
//                }
//            }
            //
            //
            //            Button(action: {
            //                print("Read Written button was tapped")
            //                //                writeXML()
            //                //                readXML()
            //                print(String(describing: globalSoapRequest))
            //            }) {
            //                HStack(spacing: 10) {
            //                    Image(systemName: "pencil")
            //                    Text("Read Written")
            //                }
            //            }
            
            
            //    #################################################################################
            //    updateGroup
            //    #################################################################################
            
       
            Divider()
            
            Group {
                
                
                Button(action: {
                    print("readXMLDataDogs button was tapped")
                    //                writeXML()
                    //                animals.readXMLDataDogs(xmlContent: xmlStringAnimals)
                    xmlString = animals.xmlDoc.xml
                    animals.readXMLDataFromString(xmlContent: xmlString)
                    //                print(globalSoapRequest)
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "pencil")
                        Text("Read Data")
                    }
                }
                                        
                Button(action: {
                    animals.separationLine()
                    print("Add child animals")
                    animals.addChild(xmlContent: xmlStringAnimals)
                }) {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Add Child")
                    }
                }
                
                Button(action: {
                    animals.separationLine()
                    print("Add child animals")
                    animals.addChildWithAttributes(xmlContent: xmlStringAnimals)
                }) {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Add Child with Attributes")
                    }
                }
                
                Button(action: {
                    animals.separationLine()
                    print("Add multiple children animals")
                    animals.addAnimalChildren(xmlContent: xmlStringAnimals)
                }) {
                    
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Add Children")
                    }
                }
            }
            
            Divider()
            
            LazyVGrid(columns: columns) {
                TextField("Node", text: self.$newNodeName)
                TextField("Child", text: self.$newChildName)
                TextField("Name", text: self.$newAnimalName)
                TextField("Colour", text: self.$newAnimalColour)
                TextField("Breed", text: self.$newAnimalBreed)
                
            
//            Button(action: {
//                print("-----------------------------")
//                print("addDog button was tapped")
//                animals.addDog(name: newAnimalName, color: newAnimalColour, breed: newAnimalBreed, xmlContent: xmlStringAnimals)
//            }) {
//                HStack {
//                    Image(systemName: "dog.fill")
//                    Text("Add Dog")
//                }            }
//                
                Button(action: {
                print("-----------------------------")
                print("addDog button was tapped")
//                animals.addDog(name: newAnimalName, color: newAnimalColour, breed: newAnimalBreed, xmlContent: xmlStringAnimals)
                    
                    animals.addChildWithAttributesGeneric(node: newNodeName, childName: newChildName, name: newAnimalName, color: newAnimalColour, breed: newAnimalBreed, xmlContent: xmlStringAnimals)
            }) {
                HStack {
                    Image(systemName: "dog.fill")
                    Text("Add Dog")
                }            }
                
            }

        } .onAppear {
            
            animals.getAllDogs(xmlContent: xmlStringAnimals)
            print("getAllDogs")
        }
        .padding()
    }
}


//}
