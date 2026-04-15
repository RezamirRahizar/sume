//
//  ResumePreview.swift
//  sume
//
//  Created by Rezamir on 15/04/2026.
//

import SwiftUI
import WebKit

let A4_WIDTH: CGFloat = 595
let A4_HEIGHT: CGFloat = 842

struct ExportView: View {
    @State private var pdfData: Data?
//    @State private var showShareSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                WebViewRepresentable(html: buildResumeHTML())
                    .frame(width: A4_WIDTH, height: A4_HEIGHT)
                    .background(.white)
                    .shadow(color: .gray.opacity(0.1), radius: 6, x:0, y:1)
                    .padding()
                    .scaleEffect(0.6)
            }
            .background(Color(.systemGray6))
            
        }
    }
}

private func buildResumeHTML() -> String {
    return """
    <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <style>
            * { margin: 0; padding: 0; box-sizing: border-box; }
            body { font-family: 'Times New Roman', Times, serif, sans-serif; margin: 40px; color: #222; font-size: 12px; }
            
            .name { font-size: 22px; font-weight: bold; margin-bottom: 6px; text-align: center;}
            .contact { font-size: 11.5px; color: #555; margin-bottom: 20px; text-align: center; }
            .contact span { margin-right: 12px; }
            
            h2 { 
                font-size: 12px; 
                font-weight: bold;
                text-transform: uppercase; 
                letter-spacing: 1px;
                border-bottom: 1px solid #ccc; 
                padding-bottom: 4px; 
                margin-top: 20px; 
                margin-bottom: 10px;
                color: #333; 
            }
            
            .job { margin-bottom: 14px; }
            .job-header { display: flex; justify-content: space-between; margin-bottom: 2px; }
            .job-title { font-weight: bold; }
            .job-date { color: #555; font-size: 11px; }
            .job-company { color: #555; margin-bottom: 6px; }
            
            ul { padding-left: 32px; }
            ul li { margin-bottom: 3px; line-height: 1.5; }
            
            .education-header { display: flex; justify-content: space-between; }
            .education-title { font-weight: bold; }
            .education-date { color: #555; font-size: 11px; }
            .education-sub { color: #555; margin-top: 2px; margin-bottom: 4px; }
            
            .skills p { line-height: 1.7; }
            .skills strong { color: #333; }
        </style>
        </head>
        <body>

            <div class="name">Rezamir Bin Rahizar</div>
            <div class="contact">
                <span>0192186970</span>
                <span>●</span>
                <span>Shah Alam, Selangor</span>
                <span>●</span>
                <span>rrezamir@gmail.com</span>
                <span>●</span>
                <span>Malaysian</span>
            </div>

            <h2>Experience</h2>

            <div class="job">
                <div class="job-header">
                    <span class="job-title">Associate Mobile Engineer</span>
                    <span class="job-date">Sept. 2025 – Present</span>
                </div>
                <div class="job-company">Nintex | Kuala Lumpur, Malaysia</div>
                <ul>
                    <li>Maintained and enhanced the Nintex Mobile App across iOS (Swift and Objective-C) and Android (Java and Kotlin) platforms.</li>
                    <li>Led Android and iOS accessibility testing and remediation using platform tools to achieve WCAG 2.1 compliance.</li>
                    <li>Updated the Nintex Mobile App on Android to meet 16KB page size and Android 15 compliance requirements for Google Play.</li>
                    <li>Stabilized automation and release pipelines by diagnosing and resolving build and deployment failures.</li>
                </ul>
            </div>

            <div class="job">
                <div class="job-header">
                    <span class="job-title">iOS Developer</span>
                    <span class="job-date">April 2022 – Aug. 2025</span>
                </div>
                <div class="job-company">Touch N Go Digital | Kuala Lumpur, Malaysia</div>
                <ul>
                    <li>Cross-collaborated across different departments to deliver new features and products in the eWallet application using Swift UIKit and Objective-C.</li>
                    <li>Developed iOS-specific features such as home screen and lock screen widgets using WidgetKit and SwiftUI.</li>
                    <li>Utilized AVFoundation, Google ML Kit and TensorFlowLite to create an internal facial detection tool for the Business Intelligence team.</li>
                    <li>Developed a standalone app for onboarded merchants using Flutter Web.</li>
                    <li>Increased overall unit test coverage by 45%, maintaining consistent 90% coverage using the XCTest framework.</li>
                    <li>Implemented reactive programming using RxSwift while adhering to the MVVM architecture.</li>
                </ul>
            </div>

            <div class="job">
                <div class="job-header">
                    <span class="job-title">Junior IT Executive</span>
                    <span class="job-date">Feb. 2021 – May. 2021</span>
                </div>
                <div class="job-company">Superdough Sdn Bhd | Kuala Lumpur, Malaysia</div>
                <ul>
                    <li>Developed a full web application using ReactJS, ExpressJS, NodeJS, MySQL and Socket.io for the company's virtual escape game.</li>
                    <li>Developed a puzzle game using C# and Unity embedded into the virtual escape game.</li>
                </ul>
            </div>

            <h2>Education</h2>

            <div class="education-header">
                <span class="education-title">University of Malaya</span>
                <span class="education-date">2018 – 2022</span>
            </div>
            <div class="education-sub">Bachelor of Computer Science (Software Engineering)</div>
            <ul>
                <li>CGPA: 3.76 / 4.0</li>
            </ul>

            <h2>Skills</h2>

            <div class="skills">
                <p><strong>Programming Languages:</strong> Swift, Objective-C, Java, Kotlin, JavaScript</p>
                <p><strong>Frameworks/Technologies:</strong> UIKit, SwiftUI, RxSwift, Snapkit, Flutter, AVFoundation, WidgetKit, Google MLKit, React JS</p>
            </div>

        </body>
        </html>
    """
}

#Preview {
    ExportView()
}
