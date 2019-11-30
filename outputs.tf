output "instance_ids" {
  value = [
    for instance in aws_instance.default :
    instance.id
  ]
}

output "instance_public_ips" {
  value = [
    for instance in aws_instance.default :
    instance.public_ip
  ]
}

output "instance_private_ips" {
  value = [
    for instance in aws_instance.default :
    instance.private_ip
  ]
}
