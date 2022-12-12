## Destroy vpcs and resources in multiple regions via terraform workspaces. This is a companion script 
#       to that which builds the resources (same repo).
#
# Set up some verbosity from -v flag  
verbose=false      #/default, pass in verbose if debug prompts desired
while getopts :v opt; do
        case $opt in
                v) verbose=true
        esac
done

if $verbose; then 
        echo "  ... Verbose / debug mode enabled."
        read -p "Destroying the VPCs and resources. Enter to continue, Ctrl-C to abort."
fi

#
# Set up the region array 
region_array=(
        "oregon"
        "ohio"
        "paris"
        "sydney"
)

echo "  ... Looping through each workspace, coping in the main.tf for the workspace, and destroy all resources."

for i in "${region_array[@]}"; do 
        terraform workspace select $i
        region=$(terraform workspace show)
        if [[ "$region" != "$i" ]]
        then 
                echo "Not in correct TF workspace, aborting.";
                exit 0
        fi
        #
        # Workspace is correct, copy up main.tf for this region and build the VPC
        #
        rm "main.tf"    # Delete any existing main.tf in this directory
        fname="main.tf.""$i"
        subdir="./vpc_main_files/"
        #
        #get main.region file from subdir and name main.tf
        echo $subdir
        echo $fname
        cp $subdir/$fname ./"main.tf"
        #read -p "  >>> Debug pause"

        #######################################################################################
        #  Here we go, will build a VPC in each region in an individual workspace per region. 
        #######################################################################################
        terraform init
        terraform plan

        if $verbose; then 
        read -p "  >>> Going to destroy the infra now, without prompt. Enter to continue, Ctrl-C to abort."
        fi 
        terraform destroy -auto-approve

done
echo "  ... All resources destroyed, deleting cached tfstate files from create script."
rm -r ./tfstate_cache/*
#

