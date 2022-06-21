terraform {
  cloud {
    organization = "jellayy"

    workspaces {
      name = "atlantis-testing"
    }
  }
}

resource "random_pet" "cat" {
}

output "cat_name" {
  value = random_pet.cat.id
}
