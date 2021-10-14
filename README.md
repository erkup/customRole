# Create & assign a custom role  

Bicep example that creates the following:  

* A custom role deployed at the subscription scope  
* A resource group & an Azure Automation Account w/ a system managed identity  
* Assigns the custom role to the Automation Account identity  

# Deployment  

Open Cloudshell in the Azure portal. Clone the repo -> run:

```Powershell  
New-AzDeployment -Location EastUS -TemplateFile "./main.bicep"
```  

or  

```bash  
az deployment sub create --location EastUS --template-file ./main.bicep  
```  
