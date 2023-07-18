output "cluster_name" {
  value = aws_eks_cluster.${var.prefix}-cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.${var.prefix}-cluster.endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.${var.prefix}-cluster.certificate_authority[0].data
}

output "eks_cluster_autoscaler_arn" {
  value = aws_iam_role.eks_cluster_autoscaler.arn
}