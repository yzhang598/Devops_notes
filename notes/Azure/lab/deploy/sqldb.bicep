@description('The name of the SQL logical server.')
param serverName string = 'mhcsql598'

@description('The name of the SQL Database.')
param sqlDBName string = 'mhcdb'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param administratorLogin string = 'sqladmin'

@description('The administrator password of the SQL logical server.')
@secure()
param administratorLoginPassword string

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

resource SQLAllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2020-11-01-preview' = {
  name: 'AllowAllWindowsAzureIps'
  parent: sqlServer
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

@description('Output the login server property for later use')
output Servername string = sqlServer.name

// az deployment group create --resource-group devopslab --template-file sqldb.bicep --parameters administratorLogin=yzhang598
