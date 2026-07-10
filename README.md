# GCP Secure Network Baseline

This repository contains a modular and secure Infrastructure as Code (IaC) baseline to deploy a Virtual Private Cloud (VPC) in Google Cloud Platform using Terraform.

## Architecture Highlights
- **Automated VPC Management:** Built leveraging the official Google Cloud Terraform modules for production-grade reliability.
- **Network Segmentation:** Features a public-facing subnet (`subnet-public`) and an isolated private subnet (`subnet-private`) with Private Google Access enabled.
- **Security First:** Includes baseline firewall rules restricting ingress traffic, and zero-leak credential management via a strict `.gitignore` configuration.

## Prerequisites
- Terraform CLI (>= 1.0)
- Google Cloud SDK & an active GCP Project

## How to Deploy
1. Initialize the directory and download the official Google modules:
   ```bash
   terraform init