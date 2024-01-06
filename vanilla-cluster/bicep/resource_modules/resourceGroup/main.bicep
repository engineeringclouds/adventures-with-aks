targetScope = 'subscription'

// Parameters

@description('Required. The name of the resource group.')
param name string

@description('Required. The location of the resource group.')
param location string

@description('Optional. The tags of the resource group.')
param tags object = {}


// Resource Definitions

resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: name
  location: location
  tags: tags
}

// Outputs

output resourceGroupName string = resourceGroup.name
output resourceGroupLocation string = resourceGroup.location
output resourceGroupTags string = resourceGroup.id
