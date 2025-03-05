# main.tf

provider "null" {
  # Este provedor é utilizado apenas para testar se o Terraform está funcionando corretamente
}

resource "null_resource" "test" {
  # Este recurso também é apenas para teste e não cria nenhum recurso real
}
