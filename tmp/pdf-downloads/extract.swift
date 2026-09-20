import Foundation
import PDFKit
for path in CommandLine.arguments.dropFirst() {
 guard let doc=PDFDocument(url:URL(fileURLWithPath:path)) else {continue}
 var text=""
 for i in 0..<doc.pageCount {text += "\n\n--- PAGE \(i+1) ---\n" + (doc.page(at:i)?.string ?? "")}
 let out="tmp/pdf-downloads/"+URL(fileURLWithPath:path).deletingPathExtension().lastPathComponent+".txt"
 try text.write(toFile:out,atomically:true,encoding:.utf8)
 print(out)
}
