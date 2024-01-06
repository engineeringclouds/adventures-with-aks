// Parameters

@description('Required. The name of the NAT gateway.')
param name string

@description('Required. The location of the NAT gateway.')
param location string

@description('Optional. The idle timeout in minutes for the NAT gateway.')
param idleTimeoutInMinutes int = 4

@description('Optional. The list of public IP addresses (Resource IDs) associated with the NAT gateway.')
param publicIpAddresses array = []

@description('Optional. The list of public IP prefixes (Resource IDs) associated with the NAT gateway.')
param publicIpPrefixes array = []

@description('Optional. The list of availability zones where NAT gateway should be deployed.')
param zones array = [
  '1'
  '2'
  '3'
]

@description('Optional. The tags to associate with the NAT gateway.')
param tags object = {}

// Resource Definitions

resource natGateway 'Microsoft.Network/natGateways@2023-06-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    idleTimeoutInMinutes: idleTimeoutInMinutes
    publicIpAddresses: publicIpAddresses
    publicIpPrefixes: publicIpPrefixes
  }
  zones: zones
  tags: tags
}

// Outputs

output resourceId string = natGateway.id
