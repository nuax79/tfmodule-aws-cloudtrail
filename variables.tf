variable "name" {
  type        = string
  description = "CloudTrail 리소스 이름을 정의합니다."
}

variable "s3_bucket_name" {
  type        = string
  description = "CloudTrail 로그를 적재할 S3 bucket 이름을 정의합니다."
}

variable "enable_logging" {
  type        = bool
  default     = true
  description = "`true` 인 경우, Trail 감사 로그를 활성화 합니다."
}

variable "enable_log_file_validation" {
  type        = bool
  default     = true
  description = "로그 파일 무결성 유효성 검사를 사용할지 여부를 지정합니다. 로그의 검증 된 내용에 대한 서명 된 다이제스트를 생성합니다."
}


variable "is_multi_region_trail" {
  type        = bool
  default     = true
  description = "`true` 인 경우, CloudTrail이 전체 지역(multi-region)을 대상으로 생성합니다."
}

variable "include_global_service_events" {
  type        = bool
  default     = false
  description = "IAM과 같은 글로벌 서비스의 이벤트를 로그 파일에 게시하는지 여부를 정의합니다."
}


variable "cloud_watch_logs_role_arn" {
  type        = string
  description = "CloudWatch Logs 엔드 포인트가 사용자의 로그 그룹에 쓰기 위한 IAM Rola의 ARN을 정의합니다."
  default     = ""
}

variable "cloud_watch_logs_group_arn" {
  type        = string
  description = "CloudTrail 로그가 전송될 로그 그룹의 ARN을 정의합니다."
  default     = ""
}

# https://www.terraform.io/docs/providers/aws/r/cloudtrail.html
variable "event_selector" {
  type = list(object({
    read_write_type           = string
    include_management_events = bool

    data_resource = list(object({
      type   = string
      values = list(string)
    }))
  }))

  description = "이벤트 로깅을 사용하기위한 이벤트 선택기를 지정합니다. See: https://www.terraform.io/docs/providers/aws/r/cloudtrail.html"
  default     = []
}

variable "kms_key_arn" {
  type        = string
  description = "CloudTrail에서 제공하는 로그를 암호화하는 데 사용할 KMS 키 ARN을 지정합니다."
  default     = ""
}

variable "is_organization_trail" {
  type        = bool
  default     = false
  description = "`true` 인 경우, AWS Organizations 기준의 The trail 감사로그를 활성화 합니다."
}

variable "sns_topic_name" {
  type        = string
  description = "로그 파일 전송 알림을 위해 Amazon SNS 토픽(Topic) 이름을 정의합니다."
  default     = null
}


variable "tags" {
  type        = map(string)
  description = "CloudTrail 리소스의 태깅 속성으로 관리를 위한 목적으로 사용 됩니다."
  default     = {
  }
}
