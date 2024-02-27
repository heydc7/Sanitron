import SwiftUI
import Charts

struct PieChartView: View {
    
    @State private var vulnerabilities = [
        Vulnerability(title: "Information Disclosure", percentage: 12),
        Vulnerability(title: "Improper Access Cotrol", percentage: 11),
        Vulnerability(title: "Insecure Direct Object Reference(IDOR)", percentage: 9),
        Vulnerability(title: "Cross Site Scripting(XSS) - Stored", percentage: 8),
        Vulnerability(title: "Privilege Escalation", percentage: 7),
        Vulnerability(title: "Misconfiguration", percentage: 7),
        Vulnerability(title: "Improper Authentication", percentage: 5),
        Vulnerability(title: "SQL Injection", percentage: 4),
        Vulnerability(title: "Cross-Site Scripting (XSS) - Reflected", percentage: 3),
        Vulnerability(title: "Server-Side Request Forgery (SSRF)", percentage: 3)
    ]
    
    var body: some View {
        Chart(vulnerabilities) { item in 
            SectorMark(angle: .value(Text(verbatim: item.title), item.percentage), innerRadius: .ratio(0.6), angularInset:1)
                .cornerRadius(4)
                .foregroundStyle(by: .value(Text(verbatim: item.title), item.title))
                .annotation(position: .overlay, alignment: .center) { 
                    Text("\(Int(item.percentage))%")
                        .bold()
                }
        }
    }
}

#Preview {
    PieChartView()
}
