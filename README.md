# overstat


## Supported Platforms

* Centos (Tested on Centos 7.2 with kitchen-test)

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ads_role_logstashtest']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### overstat::default

Include `overstat::default` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[overstat::default]"
  ]
}
```

## License and Authors

Author:: GHostQC (<https://github.com/GHostQC>)
