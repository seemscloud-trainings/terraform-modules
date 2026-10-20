output "subnets" {
  description = "Resources indexed by input map key."
  value       = aws_subnet.main
}

output "vpc" {
  description = "Created resource, including provider-computed attributes."
  value       = aws_vpc.main
}
