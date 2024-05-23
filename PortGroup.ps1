$vmhost = Connect-VIServer -Server server_FQDN_here.com -Username "Administrator@vsphere.local"

$PGs = Import-Csv -Path "[Location of CSV file from where VM attributes will be retrieved]/PG.csv" -Delimiter ',' -Encoding utf8

New-VM | Get-Member

foreach ($pg in $PGs) {

    $VDS  = $pg.VDSwitch
    $Name = $pg.Name
    $Notes = $pg.Notes
    $Numports = $pg.NumPorts
    $vlan = $pg.Vlan
    $PortBinding = $pg.PortBinding

    New-VDPortgroup `
     -Server $vmhost `
     -VDSwitch DSwitch `
     -Name $Name `
     -NumPorts $Numports `
     -VlanId $vlan `
     -Notes $Notes `
     -PortBinding $PortBinding `
     

}

#Get-VDPortgroup | Select-Object -Property *


