targetScope = 'subscription'

param actions array = [
  'Microsoft.ClassicCompute/operatingSystems/read'
  'Microsoft.ClassicCompute/operatingSystemFamilies/read'
  'Microsoft.ClassicCompute/virtualMachines/read'
  'Microsoft.Compute/virtualMachineScaleSets/read'
  'Microsoft.Compute/virtualMachines/runCommands/read'
]

@description('Array of notActions for the roleDefinition')
param notActions array = [
]

@description('FA Custom Role definition')
param roleName string = 'FA Custom Role qa'

@description('Detailed description of the role definition')
param roleDescription string = 'Subscription Level Deployment of a Role Definition'

var roleDefName = guid(subscription().id,string(actions),string(notActions))

resource FACustomRole 'Microsoft.Authorization/roleDefinitions@2018-01-01-preview' = {
  name: roleDefName
  properties: {
    roleName: roleName
    description: roleDescription
    type: 'customRole'
    permissions: [
     {
        actions: actions
        notActions: notActions
     }
    ]
    assignableScopes: [
      subscription().id
    ]
  } 
}

output customRoleId string = last(split(FACustomRole.id, '/'))
