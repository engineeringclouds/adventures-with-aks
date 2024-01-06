// Parameters

@description('Required. The name of the virtual network.')
param name string

@description('Required. The location of the virtual network.')
param location string

@description('Required. The address prefixes for the virtual network.')
param addressPrefixes array

@description('Required. The subnets for the virtual network.')
param subnets array

@description('Optional. The tags for the virtual network.')
param tags object = {}


// Resource Definitions

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-06-01' = {
  name: name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.addressPrefix
        delegations: contains(subnet, 'delegations') ? subnet.delegations : []
        natGateway: contains(subnet, 'natGatewayId') ? {
          id: subnet.natGatewayId
        } : null
        networkSecurityGroup: contains(subnet, 'networkSecurityGroupId') ? {
          id: subnet.networkSecurityGroupId
        } : null
        routeTable: contains(subnet, 'routeTableId') ? {
          id: subnet.routeTableId
        } : null
      }
    }]
  }
  tags: tags
}

// Outputs

output resourceId string = virtualNetwork.id
output addressPrefixes array = virtualNetwork.properties.addressSpace.addressPrefixes
@description('The names of the deployed subnets.')
output subnetNames array = [for subnet in subnets: subnet.name]
@description('The resource IDs of the deployed subnets.')
output subnetResourceIds array = [for subnet in subnets: az.resourceId('Microsoft.Network/virtualNetworks/subnets', name, subnet.name)]
