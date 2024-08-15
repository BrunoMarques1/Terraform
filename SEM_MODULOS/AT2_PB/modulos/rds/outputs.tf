output "db_name" {
  description = "Public IP address of the EC2 instance"
  value       = aws_db_instance.wordpressdb.db_name
}
output "arn" {
  value = aws_db_instance.wordpressdb.arn
}