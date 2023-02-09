**Azure** 



========



[**Configure Azure resources with tools**](https://learn.microsoft.com/en-us/training/modules/configure-azure-resources-tools/)



[**Use Azure Resource Manager**](https://learn.microsoft.com/en-us/training/modules/use-azure-resource-manager/)

**===============================================**



![resource-manager-016a1bac.png](blob:file:///eea52d6c-23d7-4ed8-aabc-075b53064a5c)



**resource**

**resource group:**

​	Resources can only exist in one resource group. (Can not be share)

​	Resource Groups cannot be renamed.

​	Resource Groups can have resources of many different types (services).

​	Resource Groups can have resources from many different regions.

​	All the resources in your group should share the same lifecycle.



**resource provider**

**template** 

**declarative syntax**

**Resource providers**

​	Each resource provider offers a set of resources and operations for working with an Azure service.



**Creating resource groups**

There are some important factors to consider when defining your resource group:

​	All the resources in your group should share the same lifecycle. You deploy, update, and delete them together. If one resource, such as a database server, needs to exist on a different deployment cycle it should be in another resource group.

​	Each resource can only exist in one resource group.

​	You can add or remove a resource to a resource group at any time.

​	You can move a resource from one resource group to another group. Limitations do apply to [moving resources](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-support-resources).

​	A resource group can contain resources that reside in different regions.

​	A resource group can be used to scope access control for administrative actions.

​	A resource can interact with resources in other resource groups. This interaction is common when the two resources are related but don't share the same lifecycle (for example, web apps connecting to a database).



**Lock types**

There are two types of resource locks.

​	**Read-Only locks**, which prevent any changes to the resource.

​	**Delete locks**, which prevent deletion.





[**Configure resources with Azure Resource Manager templates**](https://learn.microsoft.com/en-us/training/modules/configure-resources-arm-templates/)

**===============================================**





**An Azure Resource Manager template is a JSON file that defines the infrastructure and configuration for the deployment.** 



**Template benefits**

​	**Templates improve consistency**. Resource Manager templates provide a common language for you and others to describe your deployments. Regardless of the tool or SDK that you use to deploy the template, the structure, format, and expressions inside the template remain the same.

​	**Templates help express complex deployments**. Templates enable you to deploy multiple resources in the correct order. For example, you wouldn't want to deploy a virtual machine prior to creating an operating system (OS) disk or network interface. Resource Manager maps out each resource and its dependent resources, and creates dependent resources first. Dependency mapping helps ensure that the deployment is carried out in the correct order.

​	**Templates reduce manual, error-prone tasks**. Manually creating and connecting resources can be time consuming, and it's easy to make mistakes. Resource Manager ensures that the deployment happens the same way every time.

​	**Templates are code**. Templates express your requirements through code. Think of a template as a type of Infrastructure as Code that can be shared, tested, and versioned similar to any other piece of software. Also, because templates are code, you can create a "paper trail" that you can follow. The template code documents the deployment. Most users maintain their templates under some kind of revision control, such as GIT. When you change the template, its revision history also documents how the template (and your deployment) has evolved over time.

​	**Templates promote reuse**. Your template can contain parameters that are filled in when the template runs. A parameter can define a username or password, a domain name, and so on. Template parameters enable you to create multiple versions of your infrastructure, such as staging and production, while still using the exact same template.

​	**Templates are linkable**. You can link Resource Manager templates together to make the templates themselves modular. You can write small templates that each define a piece of a solution, and then combine them to create a complete system.

​	**Templates simplify orchestration**. You only need to deploy the template to deploy all of your resources. Normally this would take multiple operations.



[Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview) is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources. It provides concise syntax, reliable type safety, and support for code reuse.



![bicep.png](blob:file:///1c64b90d-02a6-446f-9573-5d540546ae2d)





[**Control Azure services with the CLI**](https://learn.microsoft.com/en-us/training/modules/control-azure-services-with-cli/)

**====================================**



Azure provides three administration tools:

​	The Azure portal

​	The Azure CLI

​	Azure PowerShell







[**Deploy Azure infrastructure by using JSON ARM templates**](https://learn.microsoft.com/en-us/training/modules/create-azure-resource-manager-template-vs-code/)

**==========================================**



**Benefits of using ARM templates**

ARM templates allow you to automate deployments and use the practice of infrastructure as code (IaC).

Azure Resource Manager templates are idempotent.

![2-template-processing.png](blob:file:///b5154dca-b39a-4666-948d-f0fa9ee01cde)



{

 "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",

 "contentVersion": "1.0.0.0",

 "parameters": {},

 "functions": [],

 "variables": {},

 "resources": [],

 "outputs": {}

}





**Configure user and group accounts**

**=================================**



| **User account**                    | **Description**                                              |
| ----------------------------------- | ------------------------------------------------------------ |
| **Cloud identity**                  | A user account with a *cloud identity* is defined only in Azure AD. This type of user account includes administrator accounts and users who are managed as part of your organization. A cloud identity can be for user accounts defined in your Azure AD organization, and also for user accounts defined in an external Azure AD instance. When a cloud identity is removed from the primary directory, the user account is deleted. |
| **Directory-synchronized identity** | User accounts that have a *directory-synchronized identity* are defined in an on-premises Active Directory. A synchronization activity occurs via Azure AD Connect to bring these user accounts in to Azure. The source for these accounts is Windows Server Active Directory. |
| **Guest user**                      | *Guest user* accounts are defined outside Azure. Examples include user accounts from other cloud providers, and Microsoft accounts like an Xbox LIVE account. The source for guest user accounts is Invited user. Guest user accounts are useful when external vendors or contractors need access to your Azure resources. |



**Things to consider when choosing user accounts**

​	**Consider where users are defined**. Determine where your users are defined. Are all your users defined within your Azure AD organization, or are some users defined in external Azure AD instances? Do you have users who are external to your organization? It's common for businesses to support two or more account types in their infrastructure.

​	**Consider support for external contributors**. Allow external contributors to access Azure resources in your organization by supporting the **Guest user** account type. When the external contributor no longer requires access, you can remove the user account and their access privileges.

​	**Consider a combination of user accounts**. Implement the user account types that enable your organization to satisfy their business requirements. Support directory-synchronized identity user accounts for users defined in Windows Server Active Directory. Support cloud identities for users defined in your internal Azure AD structure or for user defined in an external Azure AD instance.



**Things to consider when managing cloud identity accounts**

There are several points to consider about managing user accounts. As you review this list, consider how you can add cloud identity user accounts for your organization.

​	**Consider user profile data**. Allow users to set their profile information for their accounts, as needed. User profile data, including the user's picture, job, and contact information is optional. You can also supply certain profile settings for each user based on your organization's requirements.

​	**Consider restore options for deleted accounts**. Include restore scenarios in your account management plan. Restore operations for a deleted account are available up to 30 days after an account is removed. After 30 days, a deleted user account can't be restored.

​	**Consider gathered account data**. Collect sign-in and audit log information for user accounts. Azure AD lets you gather this data to help you analyze and improve your infrastructure.



**Create bulk user accounts**

**Create group accounts**

| **Access rights**  | **Description**                                              |
| ------------------ | ------------------------------------------------------------ |
| **Assigned**       | Add specific users as members of a group, where each user can have unique permissions. |
| **Dynamic user**   | Use dynamic membership rules to automatically add and remove group members. When member attributes change, Azure reviews the dynamic group rules for the directory. If the member attributes meet the rule requirements, the member is added to the group. If the member attributes no longer meet the rule requirements, the member is removed. |
| **Dynamic device** | (*Security groups only*) Apply dynamic group rules to automatically add and remove devices in security groups. When device attributes change, Azure reviews the dynamic group rules for the directory. If the device attributes meet the rule requirements, the device is added to the security group. If the device attributes no longer meet the rule requirements, the device is removed. |