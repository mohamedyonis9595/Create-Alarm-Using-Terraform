# AWS CloudWatch Alarm with Terraform (`terraform-aws-cloudwatch-alarm`)

Automated infrastructure-as-code blueprint used to deploy custom metric alerting tracking maps inside an AWS account infrastructure environment.

This workspace defines an automated configuration handled by the Nautilus DevOps team to track system computing nodes and trigger metrics for host infrastructure anomalies.

---

## ⚙️ Alarm Specifications
* **Alarm Metric Identifier Asset:** `xfusion-alarm`
* **Target Metric Focus:** `CPUUtilization`
* **Namespace Hierarchy:** `AWS/EC2`
* **Threshold Boundary Limit:** Greater than `80%`
* **Evaluation Period Definition:** 1 single evaluation period of `5 minutes` (`300 seconds`)

---

## 🛠️ Configuration & Deployment Layout

### 1. Main Configuration File (`main.tf`)
```hcl
resource "aws_cloudwatch_metric_alarm" "xfusion_alarm" {
  alarm_name          = "xfusion-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors ec2 cpu utilization exceeding 80%"

  dimensions = {
    InstanceId = "i-0123456789abcdef0"
  }
}  
