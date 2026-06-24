resource "aws_instance" "web" {
  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id
  key_name  = var.key

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx

              cat > /usr/share/nginx/html/index.html << 'HTML'
              <!DOCTYPE html>
              <html lang="en">
              <head>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <title>Khushi's Page</title>
                  <style>
                      body {
                          margin: 0;
                          height: 100vh;
                          display: flex;
                          justify-content: center;
                          align-items: center;
                          background: linear-gradient(to right, #ff9a9e, #fad0c4);
                          font-family: Arial, sans-serif;
                      }

                      .container {
                          text-align: center;
                          background: white;
                          padding: 40px 60px;
                          border-radius: 15px;
                          box-shadow: 0 4px 10px rgba(0,0,0,0.2);
                      }

                      h1 {
                          color: #ff4d6d;
                          font-size: 3rem;
                          margin: 0;
                      }

                      p {
                          color: #555;
                          font-size: 1.2rem;
                      }
                  </style>
              </head>
              <body>
                  <div class="container">
                      <h1>Welcome, Khushi! 🌸</h1>
                      <p>This is your first Nginx web page hosted on AWS EC2 using terraform cloud automation pipeline.</p>
                  </div>
              </body>
              </html>
              HTML

              mkdir -p /var/www/html
              cp /usr/share/nginx/html/index.html /var/www/html/index.html

              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "nginx-server"
  }
}