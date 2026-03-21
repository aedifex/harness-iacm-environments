# Harness IACM Environments  
A set of environment definitions that consume versioned Terraform modules to produce real, deployable infrastructure using Harness IACM.

This repository represents the **live state of infrastructure**—where module versions are selected, composed, and applied through Harness workspaces.

## 🎯 Purpose  
This project demonstrates:

- Environment-based infrastructure modeling (dev, prod, etc.)  
- Consumption of versioned Terraform modules via Git + `ref`  
- Controlled infrastructure promotion through version updates  
- Separation of module design (library) from environment state (live)  
- Integration with Harness IACM for execution, state, and governance  

The emphasis is on clarity, repeatability, and real-world deployment patterns.

## 🏗 Architecture Overview  

### Layer 1 — Modules (external repo)  
Reusable infrastructure components.

Example:
https://github.com/aedifex/harness-iacm-terraform-modules

These define:
- EC2, VPC, etc.
- Versioned via Git tags (`v1.0.0`, `v1.1.0`)

### Layer 2 — Environments (this repo)  
Concrete infrastructure definitions.

Example:
envs/dev/ec2/
envs/prod/ec2/

Each environment:
- Pins a module version  
- Provides environment-specific inputs  
- Represents a real deployment target

## 📁 Repository Structure  
.
├── envs/
│   ├── dev/
│   │   └── ec2/
│   │       └── main.tf
│   │
│   └── prod/
│       └── ec2/
│           └── main.tf

## 🚀 How It Works  

### Define environment infrastructure  

```hcl
module "ec2" {
  source = "git::https://github.com/aedifex/harness-iacm-terraform-modules.git//modules/ec2?ref=v1.0.0"

  instance_type = "t3.micro"
}
```

### Promote changes  

- Update module version:
ref=v1.0.0 → ref=v1.1.0

- Run via Harness IaCM  
- Observe plan → apply → deployment

## 🔄 Deployment Pattern  

- Modules define **capabilities**  
- Environments define **what is deployed**  
- Version updates trigger **controlled infrastructure changes**  

In Harness:

- A **workspace maps to a specific environment path**  
- Each workspace represents a **single state of infrastructure**  
- Pipelines execute Terraform with approvals, policy checks, and visibility

## 💡 Why This Pattern  

This repository enables:

- Explicit environment definitions  
- Safe, versioned infrastructure changes  
- Easy rollback (revert `ref`)  
- No copy/paste Terraform  
- Clear separation of concerns  
- Strong alignment with Harness IaCM workflows  

It reflects how mature teams operate:

environments are composed from versioned infrastructure components

## ⚠ Notes  

- Always pin module versions (`ref`)  
- Do not use branches for production environments  
- Each environment should be isolated and independently deployable  
- Harness manages remote state and execution

## 👤 Intended Audience  

- Harness Solutions Engineers  
- Platform / DevOps teams  
- Customers evaluating IaCM patterns  
- Teams building environment-based infrastructure workflows

Live infrastructure. Versioned. Controlled. Harness-executed.