import Foundation

//Исправить код, что бы не было ошибки
let optional: Int? = 7
let nonOptional: Int = optional! //принудительное извлечение
    //второй варинат
let optional2: Int = 7 //это константа и ее присваеваем значение, оно точно не опционал
let nonOptinal2: Int? = optional2 //мы не знаем навярняка(пусть) что optional2 != nil
//Найдите ошибки
var name: String? = "Test"
var age: Int? = nil //nil опциональное значение поэтому Int?
let distance: Float = 26.7
var middleName: String? = nil
    //Возможный варинат
let name2: String = "Test"
//Полностью разверните number разными способами
let number: Int??? = 10
    //1 способ (принудительное извлечение)
let number1 = number!!!
    //2 способ (неявное извлечение)
if let number2 = number {
    if let number21 = number2 {
        if let number22 = number21 {
            number22 //number22 = 10
        }
    }
}
//Замените значение 15 на 17 в массиве
var numbers = [4, 8, 15, 16, 23, 42]
    //1 способ, если мы знаем индекс
numbers[2] = 17
numbers
    //2 cпособ, пробег
numbers[2] = 15
for (index, value) in numbers.enumerated() {
    if value == 15 {
        numbers[index] = 17
    }
}
numbers
//найдите ошибки
let array1 = [Int]()
//let array2 = [] не известен тип массива
let array3: [String] = []

let array4 = [1, 2, 3]
print(array4[0])
//print(array4[5]) в массиве лишь 3(2) элемента
array4[1...2]
//array4[0] = 4 let исключает присовение
//array4.append(4) let исключает присвоение

var array5 = [1, 2, 3]
array5[0] = array5[1]
//array5[0...1] = [4, 5]
//array5[0] = "Six" нельзя присвоить Int String
//array5 += 6 нужно использовать элемента массива для такого, а не весь массив
for item in array5 { print(item) }

//let dict1: [Int, Int] = [:] нужно использовать литерал : в типе а не перечесление через ,
//let dict2 = [:] необходимо указать тип
let dict3: [Int: Int] = [:]

let dict4 = ["One": 1, "Two": 2, "Three": 3]
//dict4[1] доступ к элементом необходимо выполнять по ключу
dict4["One"]
//dict4["Zero"] = 0 тк let
//dict4[0] = "Zero" доступ к элементом необходимо выполнять по ключу

var dict5 = ["NY": "New York", "CA": "california"]
dict5["NY"]
dict5["WA"] = "Wachington"
dict5["CA"] = nil
//Найдите деревенских, но не домашних животных из данных множеств
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
farmAnimals.symmetricDifference(houseAnimals)
//Сделайте из этого словаря новый словарь со средними рейтингами приложений
let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]
var middleAppRatings: [String: Double] = [:]
for keys in appRatings.keys {
    var middle: Double = 0
    if (appRatings[keys]?.isEmpty)! { //если массив пуст
        middleAppRatings[keys] = 0
    } else {
        for value in (appRatings[keys])! {
            middle += Double(truncating: value as NSNumber) //преобразовываем в Int
        }
        middleAppRatings[keys] = middle / Double(appRatings[keys]!.count)
    }
}
middleAppRatings //cловарь со средним рейтингом приложений
//получите строку с названиями приложений из предыдущего задания с рейтингов выше 3
var moreThanThree = String()
for (keys, value) in middleAppRatings {
    if value >= 3 {
        moreThanThree += keys + ", "
    }
}
moreThanThree.removeSubrange(moreThanThree.index(moreThanThree.endIndex, offsetBy: -2)..<moreThanThree.endIndex) //наша строка без последних 2-х символов
//Напишите функцию, которая добавляет перед началом переданной строки "Привет, " и выводит результат в консоль
    //1 варинат
func hello(_ sameStr: String) {
    print("Привет, "+sameStr)
}
hello("Том")
    //2варинт
func hay(_ sameStr: String) {
    let str = "Привет, " + sameStr
    print(str)
}
hay("Tom")
//Напишите функцию, которая принимает имя и фамилию в виде параметров и выводит строку приветствия в консоль
func greeting(_ name: String, _ surname: String) {
    hello(name+" "+surname)
}
greeting("Tom", "Darwood")
//Напишите функцию, которая принимает переменное число параметров типа int и возвращает их сумму
func sum(_ numbers: Int...) -> Int {
    var total: Int = 0
    for number in numbers {
        total += number
    }
    return total
}
sum(1, 5, 5, 4, 2, 1, 5, 4)
//Напишите замыкание, которое печатает строку "Привет" и присвойте это замыкание переменной. Вызовите замыкание
    //1 варинт
let regards = { print("Hello")}
regards()
//Напишите замыкание, которое принимает 2 числа и возвращает их сумму. Присвойте это замыкание переменной и вызовите его
let theAmount = {(_ a : Int, _ b : Int) -> Int in
    return a + b
}
let amount = theAmount(3, 4)
//Отсортируйте массив [16, 8, 15, 42, 4, 23] по убыванию
var sortArray = [16, 8, 15, 42, 4, 23]
sortArray = sortArray.sorted(by: >)
//Из массива [16, 8, 15, 42, 4, 23] сделайте массив с числами больше 10
var moreArray = [16, 8, 15, 42, 4, 23]
    //1 способ: remove
var index = 0;
for value in moreArray {
    if value < 10 {
        print(index)
        moreArray.remove(at: index)
    } else {
        index += 1
    }
}
moreArray
    //2 cпособ: func
moreArray = [16, 8, 15, 42, 4, 23]
func moreTen(_ numbers: [Int]) -> [Int] {
    var moreTenArray: [Int] = []
    for number in numbers {
        if number > 10 {
            moreTenArray.append(number)
        }
    }
    return moreTenArray
}
moreArray = moreTen(moreArray)
//Напишите функцию, которая принимает замыкание в качестве параметра и вызывает его
func arithmeticOperation(_ a: Int, _ b: Int, _ action: (Int, Int) -> Int) -> Int{
    return action(a, b)
}
let result = arithmeticOperation(10, 20, +)
//Напишите функцию, которая возвращает замыкание, которое что-то печатает в консоль
func backWrite(_ str: String, _ write: (String) -> ()) {
    write(str)
}
backWrite("Hello", {(str: String) in print(str)})
//Напишите функцию, которая повторяет переданное замыкание заданное число раз
func backWriteNext(_ str: String, _ a: Int, _ write: (String) -> ()){
    for _ in 1...a {
        write(str)
    }
}
backWriteNext("Hay", 3, {(str: String) in print(str)})
//Уберите утечку памяти
class Employee {
    weak var computer: Computer? //Employee.computer -> (weak) Computer.employee
    deinit {
        print("Employee is denit")
    }

}
class Computer {
    var employee: Employee? //Employee.computer <- Computer.employee
    deinit {
        print("Computer is denit")
    }
}

var employee: Employee? = Employee() //employee = Employee.computer
var computer: Computer? = Computer() //computer = Computer.employee
employee?.computer = computer //Employee.computer = Computer.employee цикл сильных ссылок который был заменен слабыми
computer?.employee = employee //Computer.employee = Employee.computer
computer = nil //теперь при удалении элемента память освобождается
employee = nil
//Уберите утечку памяти
class Counter {
    var value = 0
    lazy var increase = { //замыкание
        [unowned self] in //добавляем бесхосзную или слабую ссылку для замены сильной, делаем список захвата
        self.value += 1
    }
    deinit {
        print("Counter is denit")
    }
}
var counterIncrease: Counter? = Counter() //вызываем класс Counter
counterIncrease = nil //освобождаем память
//Напиште функцию, которая будет принимать строку и возвращать true, если она есть в любом из двух массивов, либо false в противном случае
let animals1 = ["dog", "cat", "bird", "pig"]
let animals2 = ["turtle", "snake", "lizard", "shark"]
func sendAnimals(_ animal1: [String], _ animal2: [String], _ someAnimal: String) -> Bool {
    if animal1.index(of: someAnimal) != nil || animal2.index(of: someAnimal) != nil { //ищем соответствия
        return true //если нашли вернять true
    }
    return false //если нет то false
}
sendAnimals(animals1, animals2, "snake")
//напишите функцию которая считает факториал
func factorial(_ n: Int) -> Int? { //привычная функция факториала для положительных чисел без учета гамма-функции
    if n == 0 {
        return 1
    }
    if n <= 0 {
        print("Negative number")
        return nil
    }
    return n * factorial(n - 1)!
}
factorial(3)
//напишите функцию, которая будет считать сколько раз в массиве встречается цифра 2
let array: [Int?] = [2, 4, 5, 5, 2, 5, 5, 5]
func howManyTwo (_ array: [Int?]) -> Int {
    var counter = 0
    if array.isEmpty { //проверка на пустоту массива
        return 0
    }
    for element in array { //пробегаемся
        if element == 2 { //если встречаем то увеличиваем
            counter += 1
        }
    }
    return counter
}
howManyTwo(array)
//напишите функцию, которая будет проверять если ли среди первых 3 элементов массива цифра 2
func howManyTwoIsThree (_ array: [Int?]) -> Bool {
    if array.isEmpty { //проверка на пустоту
        return false
    }
    if array.count > 3 && array[0...2].index(of: 2) != nil { //берем первые 3 элемента
        return true
    }
    if array.index(of: 2) != nil { //если находим 2 возвращаем true
        return true
    }
    return false
}
howManyTwoIsThree(array)
//Напишите функцию, которая будет считать колличество раз, которое две цифры 5 встречаются рядом в массиве
func fiveNear (_ array: [Int?]) -> Int {
    var counter = 0
    for index in 0..<array.count-1 { //бежим по массиву
        if array[index] == 5 && array[index] == array[index + 1] { //и считаем
            counter += 1
        }
    }
    return counter
}
fiveNear(array)
