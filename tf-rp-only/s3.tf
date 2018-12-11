resource "aws_s3_bucket_object" "object" {
  bucket = "aa-000"
  key    = "provisioner/${var.app}/${var.appVer}/index.html"
  source = "index.html"
  etag   = "${md5(file("path/to/file"))}"
}
