terraform {
  backend "gcs" {}
}

provider "google" {
  version = "2.2.0"
  project = "${var.gcloud_project_id}"
  zone    = "${var.zone}"
}

resource "google_compute_address" "machine" {
  name = "ipv4-address"
}

resource "google_compute_disk" "disk" {
  name = "boot-disk"

  type  = "pd-ssd"
  zone  = "${var.zone}"
  image = "projects/deeplearning-platform-release/global/images/family/pytorch-latest-cu100"
  size  = 60
}

resource "google_compute_instance" "default" {
  name         = "beef-slab-ml"
  machine_type = "n1-highmem-2"
  zone         = "${var.zone}"

  metadata {
    install-nvidia-driver = "True"
  }

  metadata_startup_script = "${file("./machine_startup.sh")}"

  boot_disk {
    auto_delete = false
    source      = "${google_compute_disk.disk.name}"
  }

  guest_accelerator = {
    type  = "nvidia-tesla-v100"
    count = 1
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = "${google_compute_address.machine.address}"
    }
  }

  scheduling {
    preemptible       = true
    automatic_restart = false
  }
}
