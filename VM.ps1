$vmhost = Get-VMHost -Name "[ip address of vsphere server goes here]"
$network = "[Port group to attach to VM]"
$cluster = Get-Cluster -Name "Cluster name goes here"
$datastore = Get-Datastore -Name "Datastore goes here"

$VMs = Import-Csv -Path "[Location of CSV file from where VM attributes will be retrieved]/VM.csv" -Delimiter ',' -Encoding utf8

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