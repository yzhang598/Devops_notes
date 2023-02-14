# Terraform & Azure #



## Import Exist azure resouce to terraform ##

### Create import.tf used to manage imported variables ###

```yaml
resource "azurerm_resource_group" "devopslab" {
}
```

```bash
terraform init
```

### In azure CLI ###

```bash
az group show --name devopslab --query id --output tsv
```

### Then run the comand to import ###

```bash
terraform import azurerm_resource_group.devopslab /subscriptions/cb784633-32c7-4acd-a73f-522c956c701b/resourceGroups/devopslab
```



