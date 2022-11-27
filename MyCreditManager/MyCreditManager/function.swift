import Foundation

var students: [String] = []
var studentsPointsDic: [String: String] = [:]
let pointsDic: [String: Double] = ["A+": 4.5, "A": 4, "B+": 3.5 , "B": 3,
                               "C+": 2.5, "C": 2, "D+": 1.5, "D": 1, "F": 0]

func addSudents() {
    print("추가할 학생의 이름을 입력해주세요")
    let studentName = readLine() ?? ""
    if studentName == "" {
        print("입력이 잘못되었습니다. 다시 입력해주세요.")
    } else if students.contains(studentName) {
        print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {
        students.append(studentName)
    }
}

func deleteStudents() {
    print("삭제할 학생의 이름을 입력해주세요")
    let studentName = readLine() ?? ""
    if studentName == "" {
        print("입력이 잘못되었습니다. 다시 입력해주세요.")
    } else if !students.contains(studentName) {
        print("\(studentName) 학생을 찾지 못했습니다.")
    } else {
        let index = students.firstIndex(of: studentName)!
        _ = students.remove(at: index)
        print("\(studentName) 학생을 삭제하였습니다.")
    }
}

func addStudentsPoints() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기본 점수가 갱신됩니다.")

    if input.count != 3 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if !students.contains(input[0]) {
        print("\(input[0]) 학생을 찾지 못했습니다.")
    } else {
        studentsPointsDic.updateValue(input[2], forKey: "\(input[0]) \(input[1])")
        print("\(input[0]) 학생의 \(input[1]) 과목이 \(input[2])로 추가(변경)되었습니다.")
    }
}

func deleteStudentsPoints() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }

    if input.count != 2 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if !students.contains(input[0]) {
        print("\(input[0]) 학생을 찾지 못했습니다.")
    } else {
        guard studentsPointsDic.removeValue(forKey: "\(input[0]) \(input[1])") == nil else {
            print("\(input[0]) 학생의 \(input[1])의 성적이 삭제되었습니다.")
            return
        }
    }
}

func printStudentsPoints() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요.")
    let input = readLine() ?? ""
    if input == "" {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if !students.contains(input) {
        print("\(input) 학생을 찾지 못했습니다.")
    } else {
        var result = 0.0
        var count = 0.0
        for (key, value) in studentsPointsDic {
            let student = key.split(separator: " ").map { String($0) }
            if student[0] == input {
                result += pointsDic[value] ?? 0.0
                print("\(student[1]): \(value)")
                count += 1
            }
        }
        print(String(format: "평점: %.2f", result/count))
    }
}
