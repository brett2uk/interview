# Brett Moore interview Terraform code
Imports Terraform Providers
Deploys DC and Nodes
Ignores SSL for simplicity
Inbound port 80 to nodes
Simple Nginx Based on Alpine (for memory, usually use ubuntu)
      Dockerfile Applies
      
      FROM nginx
      COPY interview-html-directory /usr/share/nginx/html
