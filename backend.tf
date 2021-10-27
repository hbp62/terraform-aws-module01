terraform {
  
  backend "remote" {
    organization = "Hardik"

    workspaces {
      name = "team-demo01"
    }
  }
}