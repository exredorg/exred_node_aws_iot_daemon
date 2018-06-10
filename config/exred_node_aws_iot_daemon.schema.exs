@moduledoc """
A schema is a keyword list which represents how to map, transform, and validate
configuration values parsed from the .conf file. The following is an explanation of
each key in the schema definition in order of appearance, and how to use them.

## Import

A list of application names (as atoms), which represent apps to load modules from
which you can then reference in your schema definition. This is how you import your
own custom Validator/Transform modules, or general utility modules for use in
validator/transform functions in the schema. For example, if you have an application
`:foo` which contains a custom Transform module, you would add it to your schema like so:

`[ import: [:foo], ..., transforms: ["myapp.some.setting": MyApp.SomeTransform]]`

## Extends

A list of application names (as atoms), which contain schemas that you want to extend
with this schema. By extending a schema, you effectively re-use definitions in the
extended schema. You may also override definitions from the extended schema by redefining them
in the extending schema. You use `:extends` like so:

`[ extends: [:foo], ... ]`

## Mappings

Mappings define how to interpret settings in the .conf when they are translated to
runtime configuration. They also define how the .conf will be generated, things like
documention, @see references, example values, etc.

See the moduledoc for `Conform.Schema.Mapping` for more details.

## Transforms

Transforms are custom functions which are executed to build the value which will be
stored at the path defined by the key. Transforms have access to the current config
state via the `Conform.Conf` module, and can use that to build complex configuration
from a combination of other config values.

See the moduledoc for `Conform.Schema.Transform` for more details and examples.

## Validators

Validators are simple functions which take two arguments, the value to be validated,
and arguments provided to the validator (used only by custom validators). A validator
checks the value, and returns `:ok` if it is valid, `{:warn, message}` if it is valid,
but should be brought to the users attention, or `{:error, message}` if it is invalid.

See the moduledoc for `Conform.Schema.Validator` for more details and examples.
"""
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
      doc: "Provide documentation for exred_node_aws_iot_daemon.ssl.certfile here.",
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
