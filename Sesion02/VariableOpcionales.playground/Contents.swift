import UIKit

//***************** VARIABLES OPCIONALES ****************
/*
 
    * Son propensas al fallo
    * Pueden guardar un dato o un nulo
    * No almacenan directamente el dato, lo que guardan es una dirección de memoria al dato
    * Son variables especiales
    * NO PUEDEN SER TRATADAS COMO UNA VARIABLE NORMAL
 
 */
var nombre: String? = nil//"Kenyi"
var apellido: String = "Rodriguez"

// Operador unwrap
/*
    SÓLO SE PUEDE APLICAR A UNA VARIABLE OPCIONAL
    Esta definido por los siguientes símb1olos (??)
    Sirve para desempaquetar el dato de una variable opcional
    En caso en el proceso se encuentre un nulo (nil) este operador te permite setear un valor por defecto.
 
 */


let datos = (nombre ?? "") + " " + apellido
print(datos)



func sumarNumero1(_ n1: Int?, conNumero2 n2: Int?) -> Int {
    
    let n1Seguro = n1 ?? 0
    let n2Seguro = n2 ?? 0
    
    let suma = n1Seguro + n2Seguro
    return suma
}

let suma = sumarNumero1(nil, conNumero2: 4)
print(suma)


//********* Guard var / let *************
/*
    sirve para crear una variable segura. Es decir, una variable distinta de nil
    Maneja errores y corta el flujo en caso encuentre uno
 */

func sumarGuardNumero1(_ n1: Int?, conNumero2 n2: Int?) -> Int? {
    
    guard let n1Seguro = n1 else {
        print("El número 1 ingresado es incorrecto")
        return nil
    }
    
    guard let n2Seguro = n2 else {
        print("El número 2 ingresado es incorrecto")
        return nil
    }
    
    return n1Seguro + n2Seguro
}

let resultado = sumarGuardNumero1(3, conNumero2: 9)
print(resultado ?? "La suma es incorrecta")



func registrarUsuario(_ nombre: String?, apellido: String?) {

    guard let nombre = nombre else {
        print("Ingresa un nombre correcto")
        return
    }
    
    guard let apellido = apellido else {
        print("Ingresa un apellido correcto")
        return
    }
    
    print("\(nombre) \(apellido) fue registrado con éxito")
}

registrarUsuario("Kenyi", apellido: "Rodriguez")
