## This script set builds AWS VPCs in multiple regions. TF has an architectural
#     limit of one AWS provider per root execution space. To work around this, we use
#     multiple TF workspaces, with TF state created in each at runtime, and multiple
#     main.tf files, one for each region. 
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
        read -p "  >>> Building VPCs in multiple regions, Enter to continue, Ctrl-C to abort."
fi

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

echo "  ... Workspaces created, will start building by region."

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
        
        if $verbose; then 
        read -p "  >>> Going to build infra now, without prompt. Enter to continue, Ctrl-C to abort."
        terraform apply -auto-approve
        fi
                        
done
echo "  ... Copying TF state to vpc_main_files"
# These are the terraform state file for each workspace, keeping backup for recovery from corruption, etc. 
cp -r terraform.tfstate.d/ tfstate_cache/
#