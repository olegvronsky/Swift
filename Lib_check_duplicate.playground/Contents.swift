func check_array_string_duplicates(inputArray: [String], removeDuplicates : Bool = false) ->
    (resolution: [Int:String], haveDuplicate: Bool, cleanArray: [String]) {
    var index1 = 0
    var index2 = 0
    var index = 0
    var resolution : [Int:String] = [:]
    var haveDuplicate = false
    var memoryArray : [String] = []
    var cleanArray : [String] = []
    var tempDict: [Int:String] = [:]
    
for value1 in input {                       // Основной цикл, перебираем значения проверяемого на дубликаты массива (input)
    var input2 = input                      // Создаем и обновляем input2 - копию массива, т.к. ниже из него будет удален проверяемый на дубликат элемент.
    var randomValue = String(Int.random(in: 65535...9999999)) + "RandomtnemelE"   // Генерируем псевдорандомную строку
        randomValue.append(randomValue.randomElement()!)                          // Добавляем в конец рандомной строки случайный элемент из этой строки
        input2.remove(at: index1)               // *Удаляем из копии массива (input2) проверяемый элемент, чтобы он не являлся дубликатом самого себя.
        input2.insert(randomValue, at: index1)  // Вставляем на место удаленного элемента нашу псевдорандомную строку
    if memoryArray.contains(value1) {       // Чтобы не делать лишних проверок уже проверенных элементов
        index1 += 1                         // Даже если итерация прерывается необходимо увеличивать значение индекса
        continue                            // мы наполняли массив элементов, дубликаты для которых были найдены,
    } else {                                // и если проверяемое значение есть в этом массиве, то пропускаем итерацию основного цикла FOR.
    for value2 in input2 {                  // Перебираем элементы массива input2. Сравниваем каждый элемент со значением value1
        if value1 == value2 {               // Если значение итерации основного цикла FOR совпадает со значением итерации внутреннего цикла FOR ----
            memoryArray.append(value1)      // Запоминаем значения основного цикла, дубликаты для которых были найдены во внутреннем цикле
            haveDuplicate = true            // --- то присвоить значение переменной
            resolution.updateValue(value2, forKey: index2) //Добавляем найденные дубликаты в базу данных КЛЮЧ:ЗНАЧЕНИЕ
        }
        if index2 == input2.count{          // Когда итерация доходит до последнего элемента копии массива - обнуляем значение индекса.
            index2 = 0                      // Если индекс не обнулить, то он будет расти, пока не закончатся все итерации двух циклов.
        }
        index2 += 1                         // Увеличиваем индекс второго цикла
    }
    }
    index1 += 1                             // Увеличиваем индекс первого цикла
}
        
    if removeDuplicates == true {           // Если параметр функции RemoveDuplicates установлен в true то выполняем инструкции ниже
        for i in input {                    // Этот цикл преобразует исходный массив (input) в словарь (TempDict)
            tempDict.updateValue(i, forKey: index)
            index += 1
        }
        for index in resolution.keys {      // Этот цикл перебирает все найденные дубликаты и удаляем их из временного словаря (TempDict)
            tempDict.removeValue(forKey: index) // в итоге мы получаем словарь, в котором остались только уникальные значения
        }
        for value in tempDict.values {      // Этот цикл преобразует словарь обратно в массив с уникальными значениями
            cleanArray.append(value)
        }
    }
        
    return (resolution, haveDuplicate, cleanArray)  // Resolution - Найденные дубликаты строк
                                                    // HaveDuplicate - True, если дубликаты найдены (по умолчанию - False)
                                                    // CleanArray - Массив без дубликатов
}

var input = ["aab", "aab", "a", "a", "aab", "aab","aab","ggg","ggg"]
var input1 = "gshgakshga"

let (dublicates, haveDuplicate, cleanArray) = check_array_string_duplicates(inputArray: input, removeDuplicates: true)

print("Input Array - \(input)")
print("Clean Array - \(cleanArray)")
print("Dublicates - \(dublicates)")
print("Have dublicates? It's \(haveDuplicate)")

