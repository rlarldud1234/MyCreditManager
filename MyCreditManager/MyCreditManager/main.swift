import Foundation

var isRun: Bool = true


while isRun {
    print("원하는 기능을 입력해주세요.")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")

    let input = readLine() ?? ""

    switch input {
    case "1":
        addSudents()
    case "2":
        deleteStudents()
    case "3":
        addStudentsPoints()
    case "4":
        deleteStudentsPoints()
    case "5":
        printStudentsPoints()
    case "X":
        isRun = false
        print("프로그램을 종료합니다...")
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }

}
