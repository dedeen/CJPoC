## Script to set up 4 TF workspaces, switch to each in turn, and run 
#     AWS VPC build in each. This is done to work around the top levl 
#     architecture of providers in TF being singular per workspace. 
#
echo "Building multiple TF workspaces, switching to each, then running TF VPC build in each. "
read -p "  >>> Enter to proceed, C to abort"
#
# Set up the region array 
region_array=(
        "oregon"
        "ohio"
        "paris"
        "sydney"
)

## Build the workspaces 
for i in "${region_array[@]}"; do 
        echo "$i"
        terraform workspace new $i
done

echo "Built TF wspaces for oregon, ohio, paris, sydney. Now going to build VPC and networks elements within each."
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
        read -p "  >>> Debug pause"


done
