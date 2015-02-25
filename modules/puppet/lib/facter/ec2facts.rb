if File.exists?("/etc/ec2-tags")
    File.open("/etc/ec2-tags", "r") do |file_handle|
        file_handle.each_line do |line|
            if line =~ /(\w+)\s+=\s+(.*)/
                key = $1
                val = $2
                Facter.add(key) do
                    setcode do
                        val
                    end
                end
            end
        end
    end
end
