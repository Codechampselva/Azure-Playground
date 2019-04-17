 module "windowsservers" {
    source                        = "Azure/compute/azurerm"
    resource_group_name           = "terraform-advancedvms"
    location                      = "westus2"
    vm_hostname                   = "mywinvm"
    admin_password                = "Electra321"
    public_ip_dns                 = ["winterravmip", "winterravmip1"]
    nb_public_ip                  = "2"
    remote_port                   = "3389"
    nb_instances                  = "2"
    vm_os_publisher               = "MicrosoftWindowsServer"
    vm_os_offer                   = "WindowsServer"
    vm_os_sku                     = "2012-R2-Datacenter"
    vm_size                       = "Standard_DS2_V2"
    vnet_subnet_id                = "${module.network.vnet_subnets[0]}"
    enable_accelerated_networking = "true"
  }
  
  output "windows_vm_public_name"{
    value = "${module.windowsservers.public_ip_dns_name}"
  }

  output "windows_vm_public_ip" {
    value = "${module.windowsservers.public_ip_address}"
  }

  output "windows_vm_private_ips" {
    value = "${module.windowsservers.network_interface_private_ip}"
  }
