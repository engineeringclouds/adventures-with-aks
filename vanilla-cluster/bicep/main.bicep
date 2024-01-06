targetScope = 'subscription'

// Parameters

@description('The location to deploy resources to')
param location string

@description('The name of the resource group')
param rgName string

// Variables


// Module Definitions

module resourceGroup 'resource_modules/resourceGroup/main.bicep' = {
  name: rgName
  params: {
    location: location
    name: rgName
  }
}
