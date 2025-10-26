variable "bucketName" {
    description = "The name of bucket"
    type = string
}

variable "web_path" {
    description = "path to local website files"
    type = string
}

variable "mime_types" {
   description = "file extension of mime types"
   type = map(string)
   default = {
     "html" = "text/html"
     "css" = "text/css"
     "jpg" = "image/jpeg"
     "js" = "application/javascript"
   }
}
  
