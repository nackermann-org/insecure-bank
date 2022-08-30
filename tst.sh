trivy -f json --output trivy.json fs .
number_of_vulns=`jq '.Results[].Vulnerabilities[] | {VulnerabilityID} | select (.[]!=null) | length' trivy.json | wc -l | tr -dc '[:digit:]'`
if (($number_of_vulns > 5)); then
	echo "Enable DTA"
else
	echo "Continue the build"
fi