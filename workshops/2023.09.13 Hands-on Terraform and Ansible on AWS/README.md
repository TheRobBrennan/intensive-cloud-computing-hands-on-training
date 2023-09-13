# Welcome

This workshop was presented live at 4pm PDT on Wednesday, September 13th, 2023. No replay is available.

Today’s workshop will be short. Jean only has thirty minutes to go through the material.

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled.png)

## Real-world Challenge Scenario

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%201.png)

### How can we use Terraform and Ansible together to deliver, deploy, and provision software within minutes?

We’re going to use Cloud9 on AWS so that we can work directly on AWS without needing to worry about local configuration and setup.

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%202.png)

1. Create a [main.tf](http://main.tf) file with configuration defined for our environment
   1. We’re going to create two EC2 instances that are our web servers that will host nginx
      1. If we wanted to create 100 instances per the challenge above, Jean advises to create a Terraform module
   2. Allow port 22 for ingress to connect remotely
   3. Allow port 80 for ingress to allow us to view our web site
   4. In our Terraform outputs, we’re going to output the two public IP addresses of our EC2 instances

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%203.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%204.png)

1. Let’s run our terraform commands
   1. `terraform init`
   2. `terraform plan`
   3. `terraform apply`

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%205.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%206.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%207.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%208.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%209.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2010.png)

For Ansible, we’re going to create an Inventory file so that Ansible can connect and install nginx for us

1. Echo the public IPs into the hosts file for Ansible
2. Let’s connect to each EC2 instance via SSH to verify we have things configured as desired

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2011.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2012.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2013.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2014.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2015.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2016.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2017.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2018.png)

### What is an Ansible playbook?

An Ansible playbook is a file you can declare - `deploy-web-servers.yml` - that defines the tasks (plays) for the configuration that Ansible needs to handle within the managed host.

Instead of SSH’ing into each instance and running configuration, we can define it once and let Ansible handle it for however many instances we need. Automatically.

Let’s configure nginx inside of each EC2 instance:

1. This file is specifying that it should run against all hosts as a root user.
2. We’ve specified tasks to install and start nginx
   1. yum, shell, and service are modules within Ansible

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2019.png)

Time to run the Ansible commands:

1. Let’s run a ping against all hosts to make sure they are reachable
2. Now we can run our playbook - which will run each one of these tasks in parallel across the instances
3. Open up your browser and verify that both public IPs display the expected page

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2020.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2021.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2022.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2023.png)

![Untitled](2023%2009%2013%20Hands-on%20Terraform%20+%20Ansible%20on%20AWS%2089a02a6b0dc84cada3297bc327665117/Untitled%2024.png)
