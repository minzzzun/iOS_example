//SPM 으로 FSCalendar 추가해야함
//FSCalendar Git 주소 - https://github.com/WenchaoD/FSCalendar.git
import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    private var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5417368412, green: 0.3800347149, blue: 0.9160677195, alpha: 1)
        
        // FSCalendar 인스턴스 생성 및 추가
        calendar = FSCalendar()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(calendar)
        
        // FSCalendar 스타일 설정
        calendar.appearance.weekdayTextColor = .blue
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.selectionColor = .lightGray
        calendar.appearance.todayColor = .orange
        
        // 이전 달과 다음 달 날짜 숨기기
        calendar.placeholderType = .fillHeadTail
        calendar.scope = .week
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            calendar.heightAnchor.constraint(equalToConstant: 400) // 원하는 높이 설정
        ])
    }
    
    // FSCalendarDataSource와 Delegate 구현
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("Selected date: \(date)")
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        // 특정 날짜에 이벤트 추가 (예시)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if formatter.string(from: date) == "2024-12-25" {
            return 1 // 이벤트 1개
        }
        return 0
    }
}
