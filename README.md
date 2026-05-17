# Azure SQL Database — Terraform Infrastructure

This repository contains Terraform configuration to provision and manage an **Azure SQL Database** infrastructure, including an Azure SQL Server, database, firewall rules, and supporting modules.

---

## 📁 Project Structure

```
Azure_SQL_Database/
└── task06/
    ├── main.tf               # Root module — wires together all resources
    ├── locals.tf             # Local values (region, tags, etc.)
    ├── outputs.tf            # Output values exposed after apply
    ├── variables.tf          # Input variable declarations
    ├── versions.tf           # Terraform & provider version constraints
    ├── terraform.tfvars      # Variable values (region, names, etc.)
    └── modules/
        ├── sql/
        │   ├── main.tf       # Azure SQL Server, Database & Firewall Rule
        │   ├── variables.tf  # SQL module input variables
        │   └── outputs.tf    # SQL module outputs
        └── webapp/
            ├── main.tf       # Web App resource configuration
            ├── variables.tf  # Web App module input variables
            └── outputs.tf    # Web App module outputs
```

---

## ☁️ Resources Provisioned

- **Azure SQL Server** — with configurable admin credentials and TLS version
- **Azure SQL Database** — with configurable SKU, collation, and license type
- **Azure SQL Firewall Rule** — to allow Azure-internal and custom IP access
- **Random Password** — auto-generated secure password for SQL admin login

---

## ⚙️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and logged in
- An active **Azure Subscription**

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Nitinkushwaha19/Azure_SQL_Database.git
cd Azure_SQL_Database/task06
```

### 2. Login to Azure

```bash
az login
```

### 3. Update variables

Edit `terraform.tfvars` to set your values:

```hcl
rg_name              = "your-resource-group"
rg_location          = "centralindia"
sql_server_name      = "your-sql-server-name"
sql_database_name    = "your-database-name"
```

### 4. Initialize Terraform

```bash
terraform init
```

### 5. Preview the plan

```bash
terraform plan
```

### 6. Apply the configuration

```bash
terraform apply
```

### 7. Destroy resources (when done)

```bash
terraform destroy
```

---

## 🔐 Security Notes

- SQL admin passwords are **auto-generated** using the `random_password` resource — never hardcoded.
- Firewall rules are scoped to **Azure internal IPs** by default (`AllowLinuxAzureIPs`).
- Minimum TLS version is enforced via `minimum_tls_version` variable.

---

## 🤝 Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Commit (`git commit -m "feat: describe your change"`)
5. Push (`git push origin feature/your-feature`)
6. Open a Pull Request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).