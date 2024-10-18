This project diagram involves deploying a web application using a CI/CD pipeline, automated with Jenkins, Docker, Terraform, Ansible, and Kubernetes (K8S). Here's a breakdown:

### **Components**:
1. **GitHub Repository** (Source of Files):
   - Contains:
     - `Jenkinsfile`: Defines pipeline steps.
     - `Terraform` files: For creating AWS infrastructure (like EC2, VPC, etc.).
     - `Ansible playbook`: Automates Jenkins installation and setup.
     - Web App (`index.html`): The app to deploy.
     - `Dockerfile`: For containerizing the web app.

2. **Jenkins on EC2**:
   - Jenkins is set up on an AWS EC2 instance. This is done using Ansible to automate its installation and configuration.
   - The Jenkins pipeline performs these tasks:
     1. Build the Docker image for the web app.
     2. Push the Docker image to **DockerHub**.
     3. Deploy the app to an **Amazon EKS** (Elastic Kubernetes Service) cluster using the Kubernetes configuration (`KUBECONFIG`).

3. **Ansible**:
   - Ansible is used to automate the Jenkins setup on the EC2 instance. This ensures Jenkins is correctly installed, configured, and running Docker-in-Docker (DinD), which allows Jenkins to handle Docker tasks within its own container.

4. **Terraform**:
   - Terraform is used to automate the AWS infrastructure setup (like creating the EC2 instance, VPC, and subnets) where Jenkins will run.
   
5. **Kubernetes (EKS)**:
   - The final deployment is made into a Kubernetes cluster (Amazon EKS) via a pipeline in Jenkins, which will handle different namespaces (Dev, Prod).
   - Kubernetes services will expose the application using different types of services (NodePort, ClusterIP, LoadBalancer) based on the environment.

---

### **Why Using Ansible?**
Ansible is being used to automate the installation and setup of Jenkins on the EC2 instance. This eliminates the need for manual installation and configuration, ensuring consistency and faster setup times.

### **Why Docker-in-Docker for Jenkins?**
Jenkins will be running in a Docker container itself, but since Jenkins needs to run Docker commands (like building Docker images), Docker-in-Docker (DinD) is used. This allows Jenkins to build and manage containers within its own container environment.

### **Why Terraform?**
Terraform is used to automate the AWS infrastructure setup, like launching the EC2 instance where Jenkins runs. Instead of manually setting up AWS resources, Terraform makes this process automated, versioned, and repeatable.

### **Why Kubernetes?**
Kubernetes is used for scalable deployments. The pipeline will deploy the Docker image to a Kubernetes cluster (Amazon EKS), which provides container orchestration for high availability and scaling.

### **Pipeline Breakdown:**
1. **Build Docker Image**: Jenkins will take the code (including `index.html`) and Dockerize it.
2. **Push to DockerHub**: The Docker image will be pushed to DockerHub, making it accessible for deployment.
3. **Deploy to EKS**: Jenkins will use `kubectl` commands or Kubernetes deployment manifests to deploy the app into the EKS cluster (different namespaces for Dev and Prod environments).

Let me know if you need more details on any part of this!

![alt text](image.png)

![alt text](image-1.png)