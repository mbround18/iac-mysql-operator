locals {
  mysql_operator_namespace = "mysql-operator"
  mysql_repository_url     = "https://mysql.github.io/mysql-operator/"
}

resource "helm_release" "my_mysql_operator" {
  name       = "mysql-operator"
  namespace  = local.mysql_operator_namespace
  chart      = var.chart
  repository = local.mysql_repository_url

  set {
    name  = "namespace"
    value = local.mysql_operator_namespace
  }

  depends_on = [
    kubernetes_namespace.mysql_operator
  ]
}

resource "kubernetes_namespace" "mysql_operator" {
  metadata {
    name = local.mysql_operator_namespace
  }
}
