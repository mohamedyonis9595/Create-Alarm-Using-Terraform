# Initialize tracking workspaces and pull internal provider maps
terraform init

# Evaluate provisioning plans against baseline cloud environments
terraform plan

# Execute adjustments live to create the alarm node asset
terraform apply -auto-approve
