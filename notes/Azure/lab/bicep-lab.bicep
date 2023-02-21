// add param for bicep
param location string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'name'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

// add resource
resource exampleStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'name'
  location: location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'BlobStorage'

}
