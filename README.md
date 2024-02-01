# enable TAG Policy in SCP with mgmt user in Control Tower account
# Workspace
    # terraform workspace new np
    # terraform workspace new prod
    # terraform workspace new security

# execute this script
    ##  terraform workspace select np
    ##  terraform apply  -var-file="<env>.tfvars"
    