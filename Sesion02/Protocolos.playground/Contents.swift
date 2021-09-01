import UIKit

/*
 
 ************************** SOLID *****************************
 Single responsability
 Open close
 Liskov sustitution
 Interface segregation
 Dependency inversion
 
 */


//******************************* Protocols *******************************
/*
    * Definición de métodos y propiedades
    * No se encuentran implementados ni inicializados.
    * Es una interfaz
    * Es un medio de comunicación entre dos clases o estructuras
 
 */

protocol Persona {
    var nombre      : String { get set }
    var apellido    : String { get set }
    var numeroDocu  : String { get set }
    
    func obtenerInformacion() -> String
}

extension Persona {
    func obtenerInformacion() -> String {
        "\(self.nombre) \(self.apellido)"
    }
}

protocol Colaborador {
    var idEmpleado: String { get set }
    var sueldo: String { get set }
}

protocol Docente {
    var especialidad: String { get set }
}

class Alumno: Persona {
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
}

class Profesor: Persona, Colaborador, Docente {
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
    var idEmpleado: String = ""
    var sueldo: String = ""
    var especialidad: String = ""
    
    func obtenerInformacion() -> String {
        "\(self.nombre) \(self.apellido) \(self.idEmpleado)"
    }
}

class Auxiliar: Persona, Colaborador {
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
    var idEmpleado: String = ""
    var sueldo: String = ""
}

class Director: Persona, Colaborador {
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
    var idEmpleado: String = ""
    var sueldo: String = ""
}

let obj1: Persona = Alumno()
let obj2: Persona = Profesor()
let obj3: Persona = Auxiliar()
obj1.obtenerInformacion()


let obj4: Colaborador = Auxiliar()
let obj5: Colaborador = Profesor()
let obj6: Colaborador = Director()
obj4.idEmpleado
obj4.sueldo




//class Persona {
//    var nombre = ""
//    var apellido = ""
//    var documento = ""
//}
//
//class Alumno: Persona {
//
//}
//
//class Empleado: Persona {
//    var idEmpleado = ""
//    var sueldo = ""
//}
//
//class Profesor: Empleado {
//
//}
//
//class Auxiliar: Empleado {
//
//}
//
//class Director: Empleado {
//
//}
