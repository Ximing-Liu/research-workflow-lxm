import Foundation
import PDFKit
import AppKit
for path in CommandLine.arguments.dropFirst() {
 guard let doc = PDFDocument(url: URL(fileURLWithPath:path)) else {print("INVALID: \(path)");continue}
 print("FILE: \(path) PAGES: \(doc.pageCount)")
 print(String((doc.page(at:0)?.string ?? "").prefix(650)))
 if let page=doc.page(at:0) {
 let im=page.thumbnail(of:NSSize(width:700,height:950), for:.mediaBox)
 if let data=im.tiffRepresentation, let rep=NSBitmapImageRep(data:data),let png=rep.representation(using:.png,properties:[:]) {try? png.write(to:URL(fileURLWithPath:"tmp/pdf-downloads/"+URL(fileURLWithPath:path).deletingPathExtension().lastPathComponent+".png"))}
 }
}
