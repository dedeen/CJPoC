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

# Build the workspaces 
for i in "${region_array[@]}"; do 
        echo "$i"
        terraform workspace new $i
done

echo "Built TF wspaces for oregon, ohio, paris, sydney. Now going to build VPC and networks elements within each."
read -p "  >>> Enter to proceed, C to abort"

suffix=0
for i in "${region_array[@]}"; do 
        terraform workspace select $i
        region=$(terraform workspace show)
        if [[ "$region" != "$i" ]]
        then 
                echo "Not in correct TF workspace, aborting.";
                exit 0
        fi
        #
        #Workspace is correct, copy up main.tf for this region and build the VPC
        #
        #Delete any existing main.tf file first from previous loop
        mv "main.tf" "main.tf.${suffix}" 2>dev/null
        suffix=$((suffix + 1))
        subdir="./""$i""_vpc"
        fname="main.""$i"
        #
        #get main.region file from subdir and name main.tf
        echo $subdir
        echo $fname
        cp $subdir/$fname ./"main.tf"
        read -p "  >>> Enter to proceed, C to abort"
done