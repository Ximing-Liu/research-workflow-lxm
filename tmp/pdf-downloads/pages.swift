import Foundation
import PDFKit
import AppKit
let specs:[(String,[Int])]=[("2025_Stella_PAWS",[7,9,15,16,17,18,19,20]),("2025_daCosta_Type_II_Mechanoreceptors",[8,15,16,17,18,19,20,21,22,23]),("2025_Maurizi_GraphMetaMat_arXiv_preprint",[12,14])]
for (name,nums) in specs {
let path="relatedwork/pdf/Nature_Machine_Intelligence/"+name+".pdf"
guard let doc=PDFDocument(url:URL(fileURLWithPath:path)) else {continue}
let width=500, height=690,cols=2, rows=(nums.count+1)/2
let canvas=NSImage(size:NSSize(width:width*cols,height:height*rows));canvas.lockFocus();NSColor.white.setFill();NSRect(x:0,y:0,width:width*cols,height:height*rows).fill()
for (i,n) in nums.enumerated() {if let page=doc.page(at:n-1){page.thumbnail(of:NSSize(width:width,height:height-20),for:.mediaBox).draw(in:NSRect(x:(i%cols)*width,y:(rows-1-i/cols)*height,width:width,height:height-20));("PDF p.\(n)" as NSString).draw(at:NSPoint(x:(i%cols)*width+10,y:(rows-1-i/cols)*height+height-20),withAttributes:[.font:NSFont.systemFont(ofSize:14)])}}
canvas.unlockFocus();let rep=NSBitmapImageRep(data:canvas.tiffRepresentation!)!;try rep.representation(using:.png,properties:[:])!.write(to:URL(fileURLWithPath:"tmp/pdf-downloads/"+name+"_pages.png"))
}
