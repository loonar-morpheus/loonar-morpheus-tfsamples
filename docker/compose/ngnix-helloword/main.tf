terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = "hello-world-nginx"
  image = docker_image.nginx.image_id
  restart = "always"

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = abspath("${path.module}/../html")
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }

  volumes {
    host_path      = abspath("${path.module}/../nginx-config")
    container_path = "/etc/nginx/conf.d"
    read_only      = true
  }
}
