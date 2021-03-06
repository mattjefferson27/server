variable "config" {
    default ={
        "server_name" = "dxetech-server-production"
        "mperrone_ssh_print" = "b6:c7:cf:30:3c:fb:ff:a8:73:d1:75:c8:3b:e4:fe:2d"
        "lmz_ssh_print" = "18:99:7d:3a:e0:e7:a6:99:ce:0e:eb:ed:a8:63:78:41"
        "image_id" = "15852860"
    }
}

provider "digitalocean" {
}

resource "digitalocean_droplet" "server" {
    image = "${var.config.image_id}"
    name = "${var.config.server_name}"
    region = "sfo1"
    size = "512mb"
    ssh_keys = ["${var.config.mperrone_ssh_print}","${var.config.lmz_ssh_print}"]
}

output "ip" {
    value = "${digitalocean_droplet.server.ipv4_address}"
}
