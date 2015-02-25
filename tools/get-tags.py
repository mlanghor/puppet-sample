import boto.ec2
import boto.utils
id = boto.utils.get_instance_metadata(timeout=2, num_retries=2)['instance-id']
az = boto.utils.get_instance_metadata(timeout=2, num_retries=2)['placement']['availability-zone']
region = az[:len(az) - 1]
conn = boto.ec2.connect_to_region(region)
f = open('/etc/ec2-tags', 'w')

filter = {'resource-id': id}
tags = conn.get_all_tags(filter)

for t in tags:
    print "ec2_" + t.name.lower() + " = " + t.value.lower()
    f.write("ec2_" + t.name.lower() + " = " + t.value.lower() + "\n")

f.close()

