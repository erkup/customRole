targetScope = 'subscription'
param AAccountRG string = 'aa-rg'
param location string = 'EastUS'
module customRole 'modules/customRole.bicep' = {
  scope: subscription()
  name: 'deployCustomRole'
}

resource aaresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: AAccountRG
  location: location
}

module creatAA 'modules/createAA.bicep' = {
  name: 'deployAutomationAccount'
  scope: resourceGroup(aaresourcegroup.name)
  params:{
    customRoleId:customRole.outputs.customRoleId
  }
}
