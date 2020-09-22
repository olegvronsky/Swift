func check_duplicates(InputArray: [String], RemoveDuplicates : Bool = false) ->
    (Resolution: [Int:String], HaveDuplicate: Bool, CleanArray: [String]) {
    var index1 : Int = 0
    var index2 : Int = 0
    var index : Int = 0
    var Resolution : [Int:String] = [:]
    var HaveDuplicate : Bool = false
    var MemoryArray : [String] = []
    var CleanArray : [String] = []
    var TempDict: [Int:String] = [:]
    
for value1 in input {                       // Основной цикл, перебираем значения проверяемого на дубликаты массива (input)
    var input2 = input                      // Создаем и обновляем input2 - копию массива, т.к. ниже из него будет удален проверяемый на дубликат элемент.
    var RandomValue = String(Int.random(in: 65535...9999999)) + "RandomtnemelE"   // Генерируем псевдорандомную строку
        RandomValue.append(RandomValue.randomElement()!)                          // Добавляем в конец рандомной строки случайный элемент из этой строки
        input2.remove(at: index1)               // *Удаляем из копии массива (input2) проверяемый элемент, чтобы он не являлся дубликатом самого себя.
        input2.insert(RandomValue, at: index1)  // Вставляем на место удаленного элемента нашу псевдорандомную строку
    if MemoryArray.contains(value1) {       // Чтобы не делать лишних проверок уже проверенных элементов
        index1 += 1                         // Даже если итерация прерывается необходимо увеличивать значение индекса
        continue                            // мы наполняли массив элементов, дубликаты для которых были найдены,
    } else {                                // и если проверяемое значение есть в этом массиве, то пропускаем итерацию основного цикла FOR.
    for value2 in input2 {                  // Перебираем элементы массива input2. Сравниваем каждый элемент со значением value1
        if value1 == value2 {               // Если значение итерации основного цикла FOR совпадает со значением итерации внутреннего цикла FOR ----
            MemoryArray.append(value1)      // Запоминаем значения основного цикла, дубликаты для которых были найдены во внутреннем цикле
            HaveDuplicate = true            // --- то присвоить значение переменной
            Resolution.updateValue(value2, forKey: index2) //Добавляем найденные дубликаты в базу данных КЛЮЧ:ЗНАЧЕНИЕ
        }
        if index2 == input2.count{          // Когда итерация доходит до последнего элемента копии массива - обнуляем значение индекса.
            index2 = 0                      // Если индекс не обнулить, то он будет расти, пока не закончатся все итерации двух циклов.
        }
        index2 += 1                         // Увеличиваем индекс второго цикла
    }
    }
    index1 += 1                             // Увеличиваем индекс первого цикла
}
        
    if RemoveDuplicates == true {           // Если параметр функции RemoveDuplicates установлен в true то выполняем инструкции ниже
        for i in input {                    // Этот цикл преобразует исходный массив (input) в словарь (TempDict)
            TempDict.updateValue(i, forKey: index)
            index += 1
        }
        for index in Resolution.keys {      // Этот цикл перебирает все найденные дубликаты и удаляем их из временного словаря (TempDict)
            TempDict.removeValue(forKey: index) // в итоге мы получаем словарь, в котором остались только уникальные значения
        }
        for value in TempDict.values {      // Этот цикл преобразует словарь обратно в массив с уникальными значениями
            CleanArray.append(value)
        }
    }
        
    return (Resolution, HaveDuplicate, CleanArray)  // Resolution - Найденные дубликаты строк
                                                    // HaveDuplicate - True, если дубликаты найдены (по умолчанию - False)
                                                    // CleanArray - Массив без дубликатов
}

var input : [String] = ["aab", "aab", "a", "a", "aab", "aab","aab","ggg","ggg"]

let (Dublicates, HaveDuplicate, CleanArray) = check_duplicates(InputArray: input, RemoveDuplicates: true)

print("Input Array - \(input)")
print("Clean Array - \(CleanArray)")
print("Dublicates - \(Dublicates)")
print("Have dublicates? It's \(HaveDuplicate)")

