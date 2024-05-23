$vmhost = Connect-VIServer -Server vcsa.mdeey.com -Username "Administrator@vsphere.local"

$PGs = Import-Csv -Path "/Users/mohammed/Documents/PowerCLI/PG.csv" -Delimiter ',' -Encoding utf8

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


