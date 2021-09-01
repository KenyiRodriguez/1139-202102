import UIKit

class Alumno {
    
    let nombre: String
    let apellido: String
    var edad: Int = 0
    
    var nombreCompleto: String {
        return "\(self.nombre) \(self.apellido)".lowercased().capitalized
    }
    
    var iniciales: String {
        let nombreInicial = self.nombre.prefix(1)
        let apellidoInicial = self.apellido.prefix(1)
        return "\(nombreInicial)\(apellidoInicial)".uppercased()
    }
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
    
    func imprimirInformacionCompleta() {
        print("\n\nNombre y Apellido: \(self.nombreCompleto)\nEdad: \(self.edad)")
    }
}

let objAlumno = Alumno(nombre: "KeNYi", apellido: "rodriguez")
objAlumno.edad = 31
print(objAlumno.nombreCompleto)
print(objAlumno.iniciales)

objAlumno.imprimirInformacionCompleta()
