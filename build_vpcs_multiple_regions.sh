## Script to set up 4 TF workspaces, switch to each in turn, and run 
#     AWS VPC build in each. This is done to work around the top level 
#     architecture of providers in TF being singular per workspace.
#     using terraform provider(s) alias functionality.  
#
echo "Destroying the VPCs built in multiple regions by the build_vpcs.. script."
read -p "  >>> Enter to proceed, C to abort"
#
# Set up the region array 
region_array=(
        "oregon"
        "ohio"
        "paris"
        "sydney"
)

echo "Going to go through each workspace, copy in the main.tf for the workspace, and destroy all resources previously built."
read -p "  >>> Enter to proceed, C to abort"

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
        read -p "  >>> Debug pause"

        #######################################################################################
        #  Here we go, will build a VPC in each region in an individual workspace per region. 
        #######################################################################################
        terraform init
        terraform plan
        read -p "  >>> Going to destroy without prompt next"
        terraform apply -auto-approve
        read -p "  >>> Debug pause"

done
read -p "  >>> All resources should have been destroyed now."

