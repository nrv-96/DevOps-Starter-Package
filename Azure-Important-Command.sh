1)Delete All Resource Group At Once Using CMD:
FOR /F %g IN ('az group list --query "[].name" --output tsv') DO az group delete --name %g --yes

