[
  extends: [],
  import: [],
  mappings: [
    "exred_node_aws_iot_daemon.ssl.keyfile": [
      commented: false,
      datatype: :binary,
      default: "~/exred_data/private.pem.key",
      doc: "Private key to connect to AWS IOT (see https://console.aws.amazon.com/iot/home?region=us-east-1#/certificatehub)",
      hidden: false,
      env_var: "EXRED_AWSIOT_PRIVATE_KEY",
      to: "exred_node_aws_iot_daemon.ssl.keyfile"
    ],
    "exred_node_aws_iot_daemon.ssl.certfile": [
      commented: false,
      datatype: :binary,
      default: "~/exred_data/certificate.pem.crt",
      doc: "Certificate to connect to AWS IOT (see https://console.aws.amazon.com/iot/home?region=us-east-1#/certificatehub)",
      hidden: false,
      env_var: "EXRED_AWSIOT_CERTIFICATE",
      to: "exred_node_aws_iot_daemon.ssl.certfile"
    ],
    "exred_node_aws_iot_daemon.ssl.cacertfile": [
      commented: false,
      datatype: :binary,
      default: "~/exred_data/ca_root.pem",
      doc: "CA Certificate to connect to AWS IOT (see https://console.aws.amazon.com/iot/home?region=us-east-1#/certificatehub)",
      hidden: false,
      env_var: "EXRED_AWSIOT_CACERTIFICATE",
      to: "exred_node_aws_iot_daemon.ssl.cacertfile"
    ]
  ],
  transforms: [],
  validators: []
]
