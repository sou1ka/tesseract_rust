fn main() {
  let text = tesseract::ocr("test.png", "jpn").unwrap();
  println!("Tesseract: {}", text);
}