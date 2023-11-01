resource "aws_guardduty_detector" "MyDetector" {
  enable                       = var.enable_guard_duty
  finding_publishing_frequency = var.finding_publishing_frequency

  datasources {
    s3_logs {
      enable = var.s3_logs_enable
    }
    kubernetes {
      audit_logs {
        enable = var.kb_audit_logs_enable
      }
    }
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          enable = var.ebs_malware_protection_enable
        }
      }
    }
  }

  tags = var.tags
}