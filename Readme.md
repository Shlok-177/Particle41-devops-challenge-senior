# 🚀 Particle41 DevOps Challenge – Simple Time Service

Welcome! This repository contains a complete solution for deploying a simple containerized Node.js service to **Azure Container Apps** using **Terraform**. The project is structured in two key parts:

---

## 📁 Repository Structure

```bash
PRACTICLE41/
├── simple-time-service/        # Node.js backend service
│   └── README.md               # App-specific deployment & run guide
│
├── terraform-azure/            # Infrastructure as Code (IaC) using Terraform
│   └── README.md               # Detailed infra setup guide
│
└── README.md                   # ← You are here (main guide)
```

---

## 🧭 Getting Started

To get the full solution running:

1. **Deploy or update the Node.js app**:
   - Navigate to `simple-time-service/`
   - Follow the app-specific `README.md` to build, test, or containerize the application.

2. **Start with the Terraform setup**:
   - Navigate to `terraform-azure/`
   - Follow the instructions in `terraform-azure/README.md` to deploy the infrastructure.
   - ⚠️ *Note*: The **Azure Container App** resource takes around **15-20 minutes** to provision. This is expected behavior.

---

## 📌 Important Notes

- This project uses **Azure Container Apps**, **VNet**, and optionally **Azure Front Door** to expose and scale the service securely.
- All resource provisioning is done using Terraform, with a modular, clean structure.

---

## 📂 Individual Project Guides

| Component            | Path                         | Description                                  |
|----------------------|------------------------------|----------------------------------------------|
| Node.js Service      | `simple-time-service/`       | App code, Dockerfile, and run instructions   |
| Terraform IaC        | `terraform-azure/`           | Azure infrastructure setup with Terraform    |

---

## 👨‍💻 Author

DevOps Engineer – *Shlok Jadeja*  

