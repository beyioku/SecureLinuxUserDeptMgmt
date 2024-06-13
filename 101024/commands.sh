# To make the directory for each department
mkdir /Management
mkdir /Technical
mkdir /Sales

# To create groups for the departments
Linux terminal and macOs
 <Linux terminal>
groupadd Management
groupadd Technical
groupadd Sales

    # To view the the list of groups (Linux)
Grep <group_name> /etc/group

 <macOs>
sudo dseditgroup -o create Sales
sudo dseditgroup -o create Technical
sudo dseditgroup -o create Management

    # To view the the list of groups  (macOs)
dscl . -list /Groups

# To create users and add to a group
 <Linux>
useradd -m -s /bin/bash -g Management mgmnt_admin
useradd -m -s /bin/bash -g Technical tech_admin
useradd -m -s /bin/bash -g Sales sales_admin

useradd -m -s /bin/bash -g Management mgmnt_user1
useradd -m -s /bin/bash -g Management mgmnt_user2

useradd -m -s /bin/bash -g Sales sales_user1
useradd -m -s /bin/bash -g Sales sales_user2

useradd -m -s /bin/bash -g Technical tech_user1
useradd -m -s /bin/bash -g Technical tech_user2

 <macOs>
 - first create each user
sudo sysadminctl -addUser mgmnt_admin -fullName "Management Admin"
sudo sysadminctl -addUser tech_admin -fullName "Technical Admin"
sudo sysadminctl -addUser sales_admin -fullName "Sales Admin"

sudo sysadminctl -addUser sales_user1 -fullName "Sales User 1"
sudo sysadminctl -addUser sales_user2 -fullName "Sales User 2"

sudo sysadminctl -addUser mgmnt_user1 -fullName "Management User 1"
sudo sysadminctl -addUser mgmnt_user2 -fullName "Management User 2"

sudo sysadminctl -addUser tech_user1 -fullName "Technical User 1"
sudo sysadminctl -addUser tech_user2 -fullName "Technical User 2"

 - assign the user to the groups
sudo dseditgroup -o edit -a tech_admin -t user Technical
sudo dseditgroup -o edit -a tech_userl -t user Technical
sudo dseditgroup -o edit -a tech_user2 -t user Technical
sudo dseditgroup -o edit -a sales_admin -t user Sales
sudo dseditgroup -o edit -a sales_user1 -t user Sales
sudo dseditgroup -o edit -a sales_user2 -t user Sales
sudo dseditgroup -o edit -a mgmnt_admin -t user Management
sudo dseditgroup -o edit -a mgmnt_user1 -t user Management
sudo dseditgroup -o edit -a mgmnt_user2 -t user Management

 - To check the groups of a user
 id <group name>
# To change both user and group ownership
sudo chown mgmnt_admin:Management Management/document.txt
sudo chown sales_admin:Sales Sales/document.txt 
sudo chown tech_admin:Technical Technical/document.txt

# To set sticky permissions, so that only the owner can delete
sudo chmod 1770 Management
sudo chmod 1770 Sales
sudo chmod 1770 Technical

# To create a document in each department directory with the administrators given full permissions
 -Creating a file
sudo echo "This file contains confidential information for the Sales department." >Sales/document.txt
sudo echo "This file contains confidential information for the Technical department." >Technical/document.txt
sudo echo "This file contains confidential information for the Management department." >Management/document.txt

 -Changing ownership of the departmental file to the departmental admin
 sudo chown mgmnt_admin:Management Management/document.txt
 sudo chown tech_admin:Technical Technical/document.txt
 sudo chown sales_admin:Sales Sales/document.txt
 
 -Making Sure the file can be read by any user in the department but only modified by the department administrator
sudo chmod 740 document.txt               # For the Management directory
sudo chmod 740 document.txt               # For the Technical directory
sudo chmod 740 document.txt               # For the Sales directory

