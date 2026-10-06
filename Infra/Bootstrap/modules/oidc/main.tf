# Skappar en oidc provider i aws
resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com" 

  client_id_list = ["sts.amazonaws.com"] 

  tags = {
    Name = var.name_tag
  }
}

  resource "aws_iam_role" "build_push" {
    name = var.build_push_role_name
  


 assume_role_policy = jsonencode({
    Version = "2012-10-17" 


     Statement = [
      { 
        Effect = "Allow"

        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }

        Action = "sts:AssumeRoleWithWebIdentity"

        Condition = {
        
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }

          
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:Muscabali68-sudo*"
          }
        }
      }
     ]
 }
  }

 








  



  #premison role for build push
resource "aws_iam_policy" "build_push" {
    name = var.build_push_policy_name
    role = aws_iam_role.build_push.id

    policy = jsonencode({
    Version = "2012-10-17"
    
    Statement = [
      {
        Sid    = "Allow_Push_images"
        Effect = "Allow"
        
        Action = [
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:BatchGetImage"
        ]
         Resource = var.ecr_repository_arn
      }
    ]
    },
    { Sid    = "Request_token"
      Effect = "Allow"

      Action = [
        "ecr:GetAuthorizationToken"
        ]
         Resource = "*"
        }
    }



  resource "aws_iam_role" "terrafrom_deployment" {
    name = var.deployment_role_name 

    Version = "2012-10-17" 


     Statement = [
      { 
        Effect = "Allow"

        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }

        Action = "sts:AssumeRoleWithWebIdentity"

        Condition = {
        
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }

          
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:Muscabali68-sudo*"
          }
        }
      }
     ]
 
  

resource "aws_iam_policy" "deployment" {
    name = var.deployment_policy_name
    role = aws_iam_role.terrafrom_deployment.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    =
        Effect = "Allow"

       
        Action = [
          "ec2:*",
          "ecs:*",
          "elasticloadbalancing:*",
          "elasticfilesystem:*",
          "logs:*",
          "acm:*",
          "route53:*",
          "ecr:DescribeRepositories",
          "ecr:DescribeImages",
          "ecr:ListTagsForResource"
        ]

        Resource = "*"
      },
      {
        Sid    = 
        Effect = "Allow"

        
        Action = [
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]

    
        Resource = var.bucket_arn
      },
      {
      
        Sid    =
        Effect = "Allow"
        
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
          ]
        
         Resource = "${var.bucket_arn}/infra/*"
         }, 
         {
        
        Effect = "Allow"
       
        Action = [
          "iam:CreateRole",
          "iam:GetRole",
          "iam:DeleteRole",
          "iam:UpdateAssumeRolePolicy",
          "iam:PutRolePolicy",
          "iam:GetRolePolicy",
          "iam:DeleteRolePolicy",
          "iam:AttachRolePolicy",
          "iam:DetachRolePolicy",
          "iam:ListAttachedRolePolicies",
          "iam:ListRolePolicies",
          "iam:TagRole",
          "iam:UntagRole",
          "iam:ListInstanceProfilesForRole",
          "iam:PassRole"
        ]

        Resource = "*"
      },

      {
        Effect = "Allow"
        
        Action = [
          "route53domains:GetDomainDetail",
          "route53domains:ListTagsForDomain",
          "route53domains:UpdateDomainNameservers",
          "route53domains:GetOperationDetail"
        ]
        Resource = "*"
      }



    ]
  
  }
}


