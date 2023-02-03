## Azure AD

**Azure Active Directory (Azure AD)** is Microsoft’s cloud-based **identity and access management** service, which helps your employees sign in and access resources.

**Azure AD** takes this approach to the next level by providing organizations with an **Identity as a Service (IDaaS)** solution for all their apps **across cloud and on-premises**.

**Azure Active Directory comes in four editions**

1. **Free** MFA, SSO, Basic Security and Usage Reports, User Management
2. **Office 365 Apps** Company Branding, SLA, Two-Sync between On-Premise and Cloud
3. **Premium 1** Hybrid Architecture, Advanced Group Access, Conditional Access
4. **Premium 2** Identity Protection, Identity Governance

**Azure AD** can **authorize** and **authenticate** to multiple sources.

- To your on-premise AD 
- To your web-application
- Allow users to login with their IpD eg. Facebook or Google 
- To Office 365 or **Azure Microsoft**

**Active Directory Terminology**

**Domain**

A domain is an area of a network organized by a single authentication database

An **Active Directory** domain is a **logical grouping** of AD objects on a network

**Domain Controller (DC)**

A domain controller is a server that **authenticates** user identities and **authorizes** their access to resources.

**Domain Computer**

A computer that is registered with a central authentication database A domain computer would be an AD Object

**AD Object**

An AD Object is the basic element of Active Directory such as:

Users, Groups, Printers, Computers, Shared folders

**Group Policy Object (GPO)**

A virtual collection of policy settings. It controls what AD Objects have access to

**Organization Units (OU)**

A subdivision within an Active Directory into which you can place users, groups, computers, and other organizational units

**Directory Service**

A directory service, such as **Active Directory Domain Services (AD DS)**, provides the methods for storing directory data and making this data available to network users and administrators. A Directory service runs on a Domain Controller

**A tenant** **represents an organization** in Azure Active Directory. 

A tenant is a dedicated Azure AD Service instance.

**A tenant is automatically created when you sign up for either**

- Microsoft Azure
- Microsoft Intune
- Microsoft 365 

**Azure Active Directory Domain Services (AD DS)** provides **managed domain service** such as:

- Domain joins
- Group policies
- Lightweight directory access protocol (LDAP)
- and Kerberos / NTLM authentication.

Azure AD Connect has the following features:

- **Password hash synchronization** — sign-in method, synchronizes a hash of a users on-premises AD password with Azure AD
- **Pass-through authentication** — sign-in method, allows users to use the same password on-premises and in the cloud
- **Federation integration** — hybrid environment using an on-premises AD FS infrastructure, for certificate renewal 
- **Synchronization** — Responsible for creating users, groups, and other objects, ensures on-prem and cloud data matches
- **Health Monitoring** — robust monitoring and provide a central location in the Azure portal ← (Azure AD Connect Health) to view this activity

**Users** represent an **identity for an person or employee** in your domain.

Azure AD has two kinds of users:

- **Users** — A user belongs to your organization
- **Guest Users** — A guest user belongs to another organization

**Groups** lets the resource owner (or Azure AD directory owner), assign a set of access permissions to all the members of the group, instead of having to provide the rights one-by-one. 

**Groups contain:**

- **Owners** — Has permissions to add and remove members
- **Members** — Have permissions to do things

**Assignment**

- You can assign roles directly to a group
- You can assign applications directly to a group

There are **four ways** to **assign resource access rights** to your users:

**Direct assignment.** The resource owner directly assigns the user to the resource.

**Group assignment.** The resource owner assigns an Azure AD group to the resource, which automatically gives all of the group members access to the resource

**Rule-based assignment.** The resource owner creates a group and uses a rule to define which users are assigned to a specific resource. 

**External authority assignment.** Access comes from an external source, such as an on-premises directory or a SaaS app. 