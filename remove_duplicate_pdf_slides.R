library(pdftools)
library(qpdf)
library(digest)
library(magick)

remove_duplicate_pdf_slides <- function(input_pdf, output_pdf) {
  num_pages <- pdf_info(input_pdf)$pages
  
  # Initialize a vector to store the masked image hashes
  image_hashes <- character(num_pages)
  
  for (i in 1:num_pages) {
    # Render the page as an image
    page_image <- pdf_render_page(input_pdf, page = i, dpi = 72)
    
    # Convert raw bitmap to magick image for processing
    img <- image_read(page_image)
    
    # Mask the area where the page number is (bottom right corner)
    # Adjust the dimensions based on your page layout
    width <- image_info(img)$width
    height <- image_info(img)$height
    img <- image_crop(img, paste0(width, "x", height - 150, "+0+0")) # Crops out the bottom 50 pixels
    
    # Convert the cropped image to a format that can be hashed
    img_raw <- image_write(img, format = "png")
    
    # Hash the raw image data
    image_hashes[i] <- digest(img_raw, algo = "md5")
  }
  
  # Identify unique pages based on the masked image hash
  unique_indices <- which(!duplicated(image_hashes))
  
  # Create a temporary directory to store the individual unique pages
  temp_dir <- tempdir()
  temp_files <- file.path(temp_dir, paste0("page_", unique_indices, ".pdf"))
  
  # Extract the unique pages as separate PDFs
  for (i in seq_along(unique_indices)) {
    page_number <- unique_indices[i]
    pdf_subset(input_pdf, pages = page_number, output = temp_files[i])
  }
  
  # Combine the unique pages into a new PDF
  pdf_combine(input = temp_files, output = output_pdf)
  
  # Clean up temporary files
  file.remove(temp_files)
}