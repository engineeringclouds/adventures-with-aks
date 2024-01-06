// Parameters

@description('Required. The name of the public IP address.')
param name string

@description('Required. The location of the public IP address.')
param location string

@description('Optional. The public IP address version. Possible values are: IPv4, IPv6. Defaults to IPv4.')
param publicIPAddressVersion string = 'IPv4'

@description('Optional. The SKU of the public IP address. Possible values are: Basic, Standard. Defaults to Standard.')
param sku string = 'Standard'

@description('Optional. A list of availability zones denoting the IP allocated for the resource needs to come from.')
param zones array = []

@description('Optional. A mapping of tags to assign to the resource.')
param tags object = {}

// Resource Definitions

resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2019-11-01' = {
  name: name
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: publicIPAddressVersion
    idleTimeoutInMinutes: 4
  }
  sku: {
    name: sku
  }
  zones: zones
  tags: tags
}

// Outputs

output resourceId string = publicIPAddress.id
