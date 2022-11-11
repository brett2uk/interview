
resource "ionoscloud_datacenter" "bminterview" {
  name                  = "Datacenter bminterview"
  location              = "us/las"
  description           = "datacenter description"
  sec_auth_protection   = false
}

resource "ionoscloud_lan" "bminterview" {
  datacenter_id         = ionoscloud_datacenter.bminterview.id
  public                = false
  name                  = "Lan bminterview"
  lifecycle {
    create_before_destroy = true
  }
}

resource "ionoscloud_ipblock" "bminterview" {
  location              = "gb/lhr"
  size                  = 3
  name                  = "IP Block bminterview"
}

resource "ionoscloud_k8s_cluster" "bminterview" {
  name                  = "k8sClusterbminterview"
  k8s_version           = "1.20.10"
  maintenance_window {
    day_of_the_week     = "Sunday"
    time                = "02:00:00Z"
  }

}

resource "ionoscloud_k8s_node_pool" "bminterview" {
  datacenter_id         = ionoscloud_datacenter.bminterview.id
  k8s_cluster_id        = ionoscloud_k8s_cluster.bminterview.id
  name                  = "k8sNodePoolbminterview"
  k8s_version           = ionoscloud_k8s_cluster.bminterview.k8s_version
  maintenance_window {
    day_of_the_week     = "Monday"
    time                = "02:00:00Z"
  } 
  auto_scaling {
    min_node_count      = 3
    max_node_count      = 3
  }
  cpu_family            = "INTEL_XEON"
  availability_zone     = "AUTO"
  storage_type          = "SSD"
  node_count            = 3
  cores_count           = 2
  ram_size              = 2048
  storage_size          = 40
  public_ips            = [ ionoscloud_ipblock.bminterview.ips[0], ionoscloud_ipblock.bminterview.ips[1] ]
  lans {
    id                  = ionoscloud_lan.bminterview.id
    dhcp                = true
	routes {
       network          = "192.168.122.2/24"
       gateway_ip       = "10.1.5.17"
     }
   }  
}