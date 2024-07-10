**NOTE: The Infrastructure provisioning and manually deploying with the application is complete, I further plan to integrate Gitops workflow with ArgoCD to deploy this application.**
INSTRUCTIONS: 
**INFRASTRUCTURE PROVISIONING**
-  Terraform init
- Terraform plan
- Terraform apply

  It will take between 15-20 minutes for the VPC and EKS cluster to provision.

**  APPLICATION DEPLOYMENT STEPS**
**UPDATE YOUR KUBECONFIG**
- aws eks update-kubeconfig --region us-east-2 --name staging-demo
- kubectl create ns trading
- kubectl config set-context --current --namespace=trading
- GET THE PUBLIC IP OF YOUR INGRESS LOAD BALANCER RUNNING THE BELOW COMMANDS:
- INGRESS_LB_FQDN=$(kubectl get svc nginx-ingress-controller -n nginx-ingress -o jsonpath="{.status.loadBalancer.ingress[0].hostname}")
echo $INGRESS_LB_FQDN
- INGRESS_PUBLIC_IP=$(dig +short $INGRESS_LB_FQDN | head -n1)
echo $INGRESS_PUBLIC_IP
- Replace  these variables in 1_api.yaml and 3_frontend.yaml with your Ingress IP
-  API_PUBLIC_FQDN=trading.api.$INGRESS_PUBLIC_IP.nip.io
-  FRONTEND_PUBLIC_FQDN=trading.frontend.$INGRESS_PUBLIC_IP.nip.io

-  Access your Application with the FRONTEND_PUBLIC_FQDN!

  -

- For demo purposes, the DB user name and password are hardcoded, in an ideal scenario, you should use the recommended practices like ENV Variables, hashicorp vault or cloud-specific encryption mechanisms.

![image](https://github.com/dv-sharma/Terraform_3TierApp_EKS/assets/65087388/52bdf786-7a3c-436c-b6a3-0d10fffbf0bd)

![image](https://github.com/dv-sharma/Terraform_3TierApp_EKS/assets/65087388/66d81a79-c604-41de-b2bd-ed820f76dbd3)

