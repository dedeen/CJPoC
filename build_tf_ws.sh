## Script to set up 4 TF workspaces, switch to each in turn, and run 
#     AWS VPC build in each. This is done to work around the top levl 
#     architecture of providers in TF being singular per workspace. 
#
echo "Building multiple TF workspaces, switching to each, then running TF VPC build in each. "
read -p "  >>> Enter to proceed, C to abort"
#
terraform workspace new oregon
terraform workspace new ohio
terraform workspace new paris
terraform workspace new sydney
#
echo "Built TF wspaces for oregon, ohio, paris, sydney. Now going to build VPC and networks elements within each."
read -p "  >>> Enter to proceed, C to abort"
###
terraform workspace select oregon
region=$(terraform workspace show)
echo "In workspace for region: "$region
if [[ "$region" != "oregon" ]]
then 
        echo "Not in correct TF workspace, aborting.";
        exit 0
fi
###
terraform workspace select ohio
region=$(terraform workspace show)
echo "In workspace for region: "$region
if [[ "$region" != "ohio" ]]
then 
        echo "Not in correct TF workspace, aborting.";
        exit 0
fi
###
terraform workspace select paris
region=$(terraform workspace show)
echo "In workspace for region: "$region
if [[ "$region" != "paris" ]]
then 
        echo "Not in correct TF workspace, aborting.";
        exit 0
fi
###
terraform workspace select sydney
region=$(terraform workspace show)
echo "In workspace for region: "$region
if [[ "$region" != "sydney" ]]
then 
        echo "Not in correct TF workspace, aborting.";
        exit 0
fi
###