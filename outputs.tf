output "jenkins_public_ip" {
    description = "Public IP of the Jenkins EC2 instance"
    value       = aws_instance.jenkins_instance.public_ip
}

output "s3_bucket_name" {
    description = "S3 bucket for storing Jenkins data or artifacts"
    value       = aws_s3_bucket.jenkins_artifacts.bucket
}
