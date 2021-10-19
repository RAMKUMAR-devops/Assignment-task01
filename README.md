# Assignment-task01
This repo contains Infrastructure as a code script using terraform to provision a 3-tier application in AWS.
It provisions the following resources in AWS.

1. A VPC with 2 public and private subnets ,1 internet gateway , 1 nat gateway, 2 route tables along with their subnet associations ,NACL and secuirty groups.
<img width="1680" alt="vpc" src="https://user-images.githubusercontent.com/59164612/137837440-9a350c50-e3eb-4d67-9c92-c67ced8170a7.png">

2.MysqlRDS provisioned in the private subnet
<img width="1680" alt="rds" src="https://user-images.githubusercontent.com/59164612/137837804-2f829629-5c1f-4413-9bde-a094b6eddd9a.png">

3.Web tier and app tier servers deployed in the public subnet and private subnets respectively.
<img width="1680" alt="ec2servers" src="https://user-images.githubusercontent.com/59164612/137837977-08f440d2-643c-460f-b47e-13b0017df6ca.png">

4.2 Load balancers along with their target groups.
<img width="1680" alt="lb" src="https://user-images.githubusercontent.com/59164612/137838496-cd43cc8b-4216-43da-bc56-f7305e5d92b1.png">

5.Autoscaling group along with their launch templates.
<img width="1680" alt="autoscaling" src="https://user-images.githubusercontent.com/59164612/137838540-c2b0dd12-4a65-4282-b837-b099849d00ce.png">

6.Route53 private hoster zone to access the web servers and app servers.
<img width="1680" alt="route53 " src="https://user-images.githubusercontent.com/59164612/137838595-59ce5697-6745-4a16-960d-034cb684e427.png">

7.Terraform remote state locking is acheived using existing s3 bucket and existing dynamo db.
<img width="1680" alt="dynamo db" src="https://user-images.githubusercontent.com/59164612/137838777-690a45ba-ad75-41a1-9d5c-541818d2ed3c.png">
<img width="1680" alt="s3" src="https://user-images.githubusercontent.com/59164612/137838850-95970c15-64a2-4dc6-bf9f-cb623775a4b0.png">

8.The final ouptput from web tier .
<img width="1680" alt="web server output" src="https://user-images.githubusercontent.com/59164612/137838930-6dc639d4-b891-4bd0-b038-32d06a898628.png">




