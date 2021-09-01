import UIKit

var diccionario: [String: String] = ["nombre"   : "Kenyi",
                                     "apellido" : "Rodriguez",
                                     "dni"      : "87654321"]

diccionario["nombre"]
diccionario["apellido"]
diccionario["dni"]
diccionario["edad"] = "31"
diccionario["dni"] = "12345678"

let diccionario2: [Int: String] = [0 : "Kenyi",
                                   1 : "Rodriguez",
                                   2 : "87654321"]

diccionario2[0]
diccionario2[1]
diccionario2[2]
diccionario2[3] ?? "No existe"


var arrayDics: [[String: String]] = [diccionario, diccionario, diccionario]

//var arrayNumeros = [4, 8, 1, 5, 7]
//arrayNumeros[5]
