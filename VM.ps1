$vmhost = Get-VMHost -Name "192.168.0.56"
$network = "Management Network"
$cluster = Get-Cluster -Name "LAB-CLUSTER"
$datastore = Get-Datastore -Name "Lab-Datastore"

$VMs = Import-Csv -Path "/Users/mohammed/Documents/PowerCLI/VM.csv" -Delimiter ',' -Encoding utf8

foreach ($vm in $VMs) {

   $Name = $vm.Name
   $location = $vm.Folder
   $Num_CPU = $vm.Num_CPU
   $RAM = $vm.RAM
   
   New-VM `
   -VMHost $vmhost `
   -NetworkName $network,"Parking" `
   -ResourcePool $cluster `
   -Datastore $datastore `
   -Name $Name `
   -Location $location `
   -NumCpu $Num_CPU `
   -MemoryGB $RAM `

}


# $myVM = Get-VM -Name "*"

# $myfolders = Get-Folder -Name "*"

# Get-VM | Select-Object -Property Name,Guest,HardwareVersion,Folder 


# Get-Cluster | Select-Object -Property Name

# Get-Datacenter | Select-Object -Property Name