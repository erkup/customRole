targetScope = 'subscription'
module customRole 'modules/customRole.bicep' = {
  scope: subscription()
  name: 'deployCustomRole'
}

resource aaresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'aa-rg'
  location: 'eastus'
}

module creatAA 'modules/createAA.bicep' = {
  name: 'deployAutomationAccount'
  scope: resourceGroup(aaresourcegroup.name)
  params:{
    customRoleId:customRole.outputs.customRoleId
  }
}
