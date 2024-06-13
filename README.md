# SecureLinuxUserDeptMgmt
Implementing Secure User and Department Management in a Linux Environment

# To make the directory for each department
mkdir /<directory_name>


# To create groups for the departments
Linux terminal and macOs
 <Linux terminal>
groupadd <group_name>
 <macOs terminal>
sudo dseditgroup -o create <group_name>

   # To view the list of groups (Linux)
Grep <group_name> /etc/group
  # To view the the list of groups (macOS) *
dscl . -list /Groups

# To create users and add to a group
 <Linux>
useradd -m -s /bin/bash -g <group_name> <user>     {the user is created and automatically added to a group}

 <macOs>
 - first create each user
sudo sysadminctl -addUser mgmnt_admin -fullName "Management Admin"
 - assign the user to the groups
sudo dseditgroup -o edit -a <username> -t user <groupname>

 - To check the groups of a user
 id <group name>
# To change both user and group ownership
sudo chown <username>:<groupname> <directory to file you want to change ownership>

# To set sticky permissions, so that only the owner can delete
sudo chmod 1770 Management

# To create a document in each department directory with the administrators' given full permissions
 -Creating a file
sudo echo "This file contains confidential information for the Sales department." >Sales/document.txt
 -Changing ownership of the departmental file to the departmental admin
 sudo chown mgmnt_admin:Management Management/document.txt
 sudo chown tech_admin:Technical Technical/document.txt
 sudo chown sales_admin:Sales Sales/document.txt
 
 -Making Sure the file can be read by any user in the department but only modified by the department administrator
sudo chmod 740 document.txt               # For the Management directory
sudo chmod 740 document.txt               # For the Technical directory
sudo chmod 740 document.txt               # For the Sales directory


