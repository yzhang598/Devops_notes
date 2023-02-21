// az deployment sub create --template-file main.bicep --location eastus
targetScope = 'subscription'
param location string = 'eastus'

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'mhclab'
  location: location
}

module acr './acr.bicep' = {
  name: 'acr'
  scope: rg
  params: {
    acrName: 'mhcacr598'
    location: rg.location
  }
}

module sqldb './sqldb.bicep' = {
  name: 'db'
  scope: rg
  params: {
    administratorLoginPassword: 'P2ssw0rd1234'
    location: rg.location
  }
}

module aks './aks.bicep' = {
  name: 'aks'
  scope: rg
  params: {
    dnsPrefix: 'mhcdns'
    location: rg.location
    linuxAdminUsername: 'yzhang598'
    sshRSAPublicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqWLqPGDRlc/6EbyzWfsp2pPYf1e3okabaIogO8hhLbQlJqKXZG4IMNmtWNwbHxdM89Dif6u8qgm4M3BNSVsd6/yIURxLWris30PYaz9q/z7NKQ6jlU+HMDI98OFaKX28YkqAnPh2PyRvxLrGs9hQLtYqcyCfz7SnQj5KUo/ji8hHJQVmiKgBZuPXxUETz9ic6AC3rdSey2GnBMIqNw3DMOYuQn/zcLLtGSDFePrVyL82rVvStqzGrQAujpnLSp6Cn2uehgIUn8RZEmWYL3717x5kmYO56cCk77LT5GFMgcY9wk77/T/b6HjTYkdfzeaoS6jwkbAdVCortGa8jsGDjLSGoj66BUIFwKIWebEywRsyI3az+VXbMEnQJwNK780CtUnS+RwSig95RciJtvPFZ3YJc1pENZk3BZGbmsubw0cmEcqNjShxnCcsehp9PjvRJNaPTlRwsMRhZGcLzVSgfJrbzNPPqt9w6L2P1DkRolY/ktHv29MOu555Mhrpe1cdXNK41IuyFI97/2fSjTYPMh8RLWIJz7Vk6fefd1O/cwpgIzsS2sNGlCBgaLwA23zm22WMbe5Y4g7N7fPO7LEC20/1ggeeDcDNDGSxR66zIACV2RHYrdK09Dalli0GmAaUqUL2gpdcYU9+rsZC6fnsYa+eIosnI6uCXPc/ezyWMfQ== yize@cc-45bc0fdd-6ff76b459b-v6crp'
  }
}

// // attach the ACR to the AKS cluster
// resource aksACRAttach 'Microsoft.ContainerService/managedClusters/providers/roleAssignments@2021-04-01-preview' = {
//   name: guid(aksCluster.id, acr.id)
//   properties: {
//     roleDefinitionId: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/7f951dda-4ed3-4680-a7ca-43fe172d538d' // ACR Pull role
//     principalId: aksCluster.properties.servicePrincipalProfile.clientId
//   }
//   scope: acr.id
//   dependsOn: [ acr, aksCluster ]
// }

// az aks update -n $AKS_CLUSTER_NAME -g $AKS_RESOURCE_GROUP --attach-acr $ACR_NAME
