resource "helm_release" "autoscaler" {
  name = "autoscaler-release"

  repository       = "https://kubernetes.github.io/autoscaler"
  chart            = "cluster-autoscaler"
  namespace        = "kube-system"

  set {
    name  = "autoDiscovery.clusterName"
    value = "${var.prefix}-cluster"
  }

  set {
    name  = "awsRegion"
    value = "${data.aws_region.current.name}"
  }

  set {
    name  = "rbac.serviceAccount.name"
    value = "cluster-autoscaler"
  }

  set {
    name  = "rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "${aws_iam_role.eks_cluster_autoscaler.arn}"
  }

  set {
    name  = "image.tag"
    value = "v1.24.2"
  }

}
