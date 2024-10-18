# Final Project

## 1. Infrastructure Creation with Terraform Modules:
- **Create a VPC**: Set up a Virtual Private Cloud (VPC) with one public subnet.
- **Create an EC2 Instance**: Set up an EC2 instance in the public subnet with internet access.
- **Create a Kubernetes Cluster**: Use EKS (Elastic Kubernetes Service) to create a Kubernetes cluster within the same VPC.

## 2. Infrastructure Configuration:
- Use **Ansible** to automate the installation of Jenkins on the EC2 instance.

## 3. Prepare GitHub Repository:
- Set up a **GitHub repository** with the source code for a simple web project.
- Create two branches: **Dev** and **Prod**.
- Write a **Dockerfile** to containerize your web project.
- Prepare the necessary Kubernetes deployment files (e.g., `deployment.yaml`, `service.yaml`).

## 4. Kubernetes Configuration:
- Create two **namespaces** in your Kubernetes cluster: Dev and Prod.
- **Create deployment** and service files and put them in your GitHub repository.
- Use a **Load Balancer** to expose your application externally for both namespaces.

## 5. CI/CD Pipeline:
- Configure **Jenkins** with GitHub to automate the CI/CD process.
- Create **Jenkins pipelines** for both the Dev and Prod branches.
- Build a **Docker image** from the project and push it to Docker Hub.
- Set up **GitHub webhooks** to trigger the pipelines on code pushes:
  - For the **Dev** branch, deploy to the Dev Kubernetes namespace.
  - For the **Prod** branch, deploy to the Prod Kubernetes namespace.

## 6. Documentation:
- Document all the **tools, processes, and configurations** used throughout the task.
- Provide a detailed explanation of how each component was implemented and how the entire workflow operates.
