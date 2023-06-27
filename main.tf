provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230615"
    }
  }

  network_interface {
    network = google_compute_network.mynetwork.id
    subnetwork = google_compute_subnetwork.my_subnetwork.id
    access_config {
      // Optional: Ephemeral IP or Static IP configuration
    }
  }
}

resource "google_compute_network" "mynetwork" {
  name = var.network_name
  routing_mode="REGIONAL"
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = var.subnetwork_name
  network       = google_compute_network.mynetwork.id
  ip_cidr_range = var.subnet_cidr
}

resource "google_compute_firewall" "my_firewall" {
  name    = var.firewall_name
  network = google_compute_network.mynetwork.id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
