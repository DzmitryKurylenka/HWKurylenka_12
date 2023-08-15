import UIKit

/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

print("-- 1 --\n")

let someAnyCollections: [Any] = [2.0, 5.4, 6.8, 9, 4, 3, "Str1", "Str2", "Str3", true, false, false]
print(someAnyCollections)

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

print("\n-- 2 --\n")

for elements in someAnyCollections {
    if let integer = elements as? Int {
        print("Целое число \(integer)")
    } else if let double = elements as? Double {
        print("Вещественное число \(double)")
    } else if let string = elements as? String {
        print("Cтрока \(string)")
    } else if let bool = elements as? Bool {
        print("Булево значение \(bool)")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */

print("\n-- 3 --\n")

var dictionaryOne: [String: Any] = [:]
for (index, element) in someAnyCollections.enumerated(){
    let key = "Key\(index)"
    dictionaryOne[key] = element
}

for (key, value) in dictionaryOne {
    if let integer = value as? Int {
        print("\(key): Целое число \(integer)")
    } else if let double = value as? Double {
        print("\(key): Вещественное число \(double)")
    } else if let string = value as? String {
        print("\(key): Строка '\(string)'")
    } else if let bool = value as? Bool {
        print("\(key): Булево значение \(bool)")
    }
}

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */

print("\n-- 4 --\n")

var total: Double = 0

for (_, value) in dictionaryOne {
    if let integer = value as? Int {
        total += Double(integer)
    } else if let double = value as? Double {
        total += double
    } else if value is String {
        total += 1
    } else if let bool = value as? Bool {
        total += bool ? 2 : -3
    }
}

print("Total is \(total)")

/*:
 Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */

print("\n-- 5 --\n")

total = 0

for (_, value) in dictionaryOne {
    if let integer = value as? Int {
        total += Double(integer)
    } else if let double = value as? Double {
        total += double
    } else if let string = value as? String {
        if let convertedNumber = Double(string) {
            total += convertedNumber
        }
    }
}

print("Total is \(total)")
