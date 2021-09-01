import UIKit

var arrayEdades: [Int] = [4, 5, 19, 30, 15, 25]
arrayEdades = []
var arrayData: [String] = []
var arrayData1 = [String]()
var arrayData2: [String] = [String]()

protocol Persona {
    var nombre: String { get }
    var apellido: String { get }
    
    func imprimirTipo()
}

extension Persona {
    func imprimirDatos() {
        print("\(self.nombre) \(self.apellido)")
    }
}

protocol Empleado {
    var idEmpleado: String { get }
}

class Alumno: Persona {
    
    let nombre: String
    let apellido: String
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
    
    func imprimirTipo() {
        print("Soy un alumno")
    }
}

class Profesor: Persona, Empleado {
    
    let nombre: String
    let apellido: String
    let idEmpleado: String
    
    init(nombre: String, apellido: String, idEmpleado: String) {
        self.nombre = nombre
        self.apellido = apellido
        self.idEmpleado = idEmpleado
    }
    
    func imprimirTipo() {
        print("Soy un profesor")
    }
}

var arrayPersonas: [Persona] = []
arrayPersonas.append(Profesor(nombre: "Kenyi", apellido: "Rodriguez", idEmpleado: "87654321"))
arrayPersonas.append(Alumno(nombre: "Sagar", apellido: "Kishnani"))


for persona in arrayPersonas {
    
    persona.imprimirTipo()
    persona.imprimirDatos()
    print("\n\n")
}
