terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.37.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
}

# Google Kubernetes Engine (GKE)
resource "google_container_cluster" "primary" {
  name = "kubernetes-cluster-warmup-01"
  location = var.gcp_region
  initial_node_count = 1
  enable_autopilot = true
  ip_allocation_policy {
    # We need this empty parameter to create an empty autopilot cluster on Google Cloud. A known Terraform issue.
  }
}

# Google Cloud SQL
# Best practice - Create the database instance first before creating the database
resource "google_sql_database_instance" "instance" {
  name = "cloudwarmupsql"
  region = var.gcp_region
  database_version = "MYSQL_8_0" # MySQL v8.0
  settings {
    tier = "db-f1-micro" # Determines how much memory, CPU, etc.
  }

  deletion_protection = "true" # Avoid accidental deletion of our cloud database
}

resource "google_sql_database" "database" {
  name = "my-database"
  instance = google_sql_database_instance.instance.name # Refer to the name of the instance we defined above
}
