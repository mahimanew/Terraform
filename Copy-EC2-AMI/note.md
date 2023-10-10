Terraform does not have a built-in capability to directly copy Amazon Machine Images (AMIs) from one region to another. You would typically use the AWS CLI or SDKs to copy an AMI to another region, and then you can use Terraform to work with resources in that target region.

syntax:
aws ec2 copy-image \
  --source-image-id ami-id \
  --source-region source-region \
  --name "My Copied AMI" \
  --region target-region

put this copy image command to bash file then run in terminal

run command in terminal
------------------------
./copyimage.sh



And, we can copy AMI image from one account to another account with the help of below steps
1=> select your image, then go to action->edit AMI permisiion
2=> then select, Add 'Create volume' permission to associated snapshots when creating account permissions.
3=> Then add your account id in shared account
4=> select account id box, then click on save changes
5=> after some times this account AMI will be copied to destination account
6=> if you want to stop sharing you can edit persission and remove the destination account id, then will be removed in destination account.
