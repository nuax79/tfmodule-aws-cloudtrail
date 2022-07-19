# tfmodule-aws-cloudtrail
aws-cloudtrail 구성을 표준화 / 템플릿화 하여 쉽고 재사용 가능한 수준으로 하기 위한 Terraform 자동화 템플릿.


## Variables
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name  | CloudTrail 리소스 이름을 정의합니다. | string |  | Yes |
| s3_bucket_name  | CloudTrail 로그를 적재할 S3 bucket 이름을 정의합니다. | string |  | Yes |
| enable_logging  | `true` 인 경우, Trail 감사 로그를 활성화 합니다. | bool | true | No |
| enable_log_file_validation  | 로그 파일 무결성 유효성 검사를 사용할지 여부를 지정합니다. 로그의 검증 된 내용에 대한 서명 된 다이제스트를 생성합니다. | bool | true | No |
| is_multi_region_trail  | `true` 인 경우, CloudTrail이 전체 지역(multi-region)을 대상으로 생성합니다. | bool | true | No |
| include_global_service_events  | `true` 인 경우, IAM과 같은 글로벌 서비스의 이벤트를 로그 파일에 게시하는지 여부를 정의합니다. | bool | false | No |
| cloud_watch_logs_role_arn  | CloudWatch Logs 엔드 포인트가 사용자의 로그 그룹에 쓰기 위한 IAM Rola의 ARN을 정의 합니다. | string |  | No |
| cloud_watch_logs_group_arn  | CloudTrail 로그가 전송될 로그 그룹의 ARN을 정의합니다. | string |  | No |
| event_selector  | 이벤트 로깅을 사용하기위한 이벤트 선택기를 지정합니다. | list(object) | [] | No |
| kms_key_arn  | CloudTrail에서 제공하는 로그를 암호화하는 데 사용할 KMS 키 ARN을 지정합니다. | string |  | No |
| is_organization_trail  | `true` 인 경우, AWS Organizations 기준의 The trail 감사로그를 활성화 합니다. | bool | false | No |
| sns_topic_name  | 로그 파일 전송 알림을 위해 Amazon SNS 토픽(Topic) 이름을 정의합니다.| string |  | No |


## Examples
- [simple](./examples/simple/README.md)

[HCL 코드 스니펫]
```hcl
module "cloudtrail" {
  source         = "git::https://github.com/nuax79/tfmodule-aws-cloudtrail.git"
  name           = "sample-cloudtrail"
  s3_bucket_name = "sample-bucket"
  tags           = {}
}
```


## Appendix
[AWS CloudTrail User Guide](https://docs.aws.amazon.com/ko_kr/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
