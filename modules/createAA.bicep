// Create automation account
param aaName string ='TestFA-AA'
param customRoleId string
resource automationAccount 'Microsoft.Automation/automationAccounts@2020-01-13-preview' = {
  name: aaName
  location: resourceGroup().location
  identity: {
    type:'SystemAssigned'
  }
  properties: {
    sku: {
      name: 'Basic'
    }
  }
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2021-04-01-preview' = {
  name: guid(automationAccount.id)
  scope: automationAccount
  properties: {
    principalId: automationAccount.identity.principalId
    roleDefinitionId: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/${customRoleId}'
    principalType: 'ServicePrincipal'
  }
}

output aaSysManagedId string = automationAccount.identity.principalId
output roleDefinitionId string = '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/${customRoleId}'
