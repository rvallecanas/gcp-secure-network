variable "project_id" {
  description = "El ID del proyecto de Google Cloud donde se desplegarán los recursos"
  type        = string
}

variable "region" {
  description = "La región por defecto para los recursos"
  type        = string
  default     = "us-central1"
}