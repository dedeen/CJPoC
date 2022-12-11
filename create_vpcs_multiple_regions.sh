## This script set builds AWS VPCs in multiple regions. TF has an architectural
#     limit of one AWS provider per root execution space. To work around this, we use
#     multiple TF workspaces, with TF state created in each at runtime, and multiple
#     main.tf files, one for each region. 
#
echo "  >>> Building VPCs in multiple regions." 
read -p "  >>> Enter to proceed, Ctrl-C to abort."
#
# Set up the region array 
region_array=(
        "oregon"
        "ohio"
        "paris"
        "sydney"
)

## Build the TF workspaces, one per region listed above. 
for i in "${region_array[@]}"; do 
        terraform workspace new $i
done

echo "  >>> Workspaces created, will start building by region."
read -p "  >>> Enter to proceed, Ctrl-C to abort."

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
        rm "main.tf"            # Delete any existing main.tf in this directory
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
        read -p "  >>> Going to build next without prompt. Ctrl-C to abort. commit without prompt next"
        terraform apply -auto-approve
                
done
read -p "  >>> Copying TF state to vpc_main_files"
# These are the terraform state file for each workspace, keeping backup for recovery from corruption, etc. 
cp -r terraform.tfstate.d/ tfstate_cache/
#