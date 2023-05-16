1)Create Resource Group:
az group create --name 1 --location eastus

2)Delete All Resource Group At Once Using CMD:
FOR /F %g IN ('az group list --query "[].name" --output tsv') DO az group delete --name %g --yes

