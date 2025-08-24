# 🚀 3-Tier Architecture Terraform Module

Welcome to the **3-Tier Architecture Terraform Module** by Rudra-Langote!  
🔧 This Terraform module helps you deploy a classic scalable 3-tier architecture on the cloud (most likely AWS). Perfect for production-ready apps!

---

## 📦 Features

- Reusable Terraform module to create a **3-tier architecture**
- Clean separation for **web, application, and database tiers**
- Written in HCL (100%)
- Easily configurable for diverse environments (dev, stage, prod)
- Modular design for maintainability and scalability

---

## 🔍 What is a 3-Tier Architecture?

A standard 3-tier architecture consists of:
- **Web Tier** 🌐 – Handles user requests (typically load balancers and public subnets)
- **Application Tier** ⚙️ – Business logic layer (app servers in private subnets)
- **Database Tier** 🗄️ – Data storage and management (DB instances in isolated subnets)

---

## 🏗️ Repository Structure

> Typical files in this module:

📁 main.tf # Main resources
📁 variables.tf # Input variables
📁 outputs.tf # Output values
📁 README.md # Documentation

---

## 🚦 Getting Started

1. **Clone the repo**
git clone https://github.com/Rudra-Langote/3-tire-arc-terraform-module.git


2. **Customize your variables** (in `variables.tf`).

3. **Initialize Terraform**
terraform init


4. **Apply configuration**
terraform apply

---

## ✨ Usage Example

module "three_tier_app" {
source = "./3-tire-arc-terraform-module"

Add your variable customizations here
}

---

## 🎯 Benefits

- DRY (Don't Repeat Yourself) infra code
- Easy to maintain and modify architecture
- Enables infrastructure best practices
- Ready for CI/CD integration

---

## 📝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---
Open issues or discussions in the repo for questions!

---
