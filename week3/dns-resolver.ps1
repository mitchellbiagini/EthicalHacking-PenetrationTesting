param($prefix, $server)

$network = $prefix.Split('/')[0]
$base = $network.Split('.') [0 .. 2] -join '.'

1 .. 254 | ForEach-Object {
  $ip = "$base.$"
  $result = Resolve-DnsName -DnsOnly $ip -Server $server -ErrorAction Ignore
  if ($result) { "$($result.NameHost) ($ip)" }
  }
